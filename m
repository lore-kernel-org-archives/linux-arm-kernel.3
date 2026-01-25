Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F7BE63CA6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvZOhcEeiDCGj1pWI0Gi+YoPkJsN0PIBRkMlxYK/caE=; b=iFIhJXFjdgfP6DluUUNtR9xwRg
	EaYix9ksDOIX/kRMUSxL76Ii1dyHP50i5UvGcgm7z/Ebh2UoU11h8JAMSzfTriFf1DaBMtiLw4s+J
	QlO4qOT19DqQ+riZJQr2vAE3qAAch4WYR9ME1snQ5GDkJBdQmxxbKHKM0TKnhZKTt3mbgqTVI5Zxs
	bhKwekmH3yGdOmasE04IA+pwUY2g6bFasyHnXPXReVwEgCxMy9K+F+SHO2u1bPOwZpV807iO2WY1e
	fU+mvLgpXPg+wBya3aQjRyBtebXD5FsOA5Q+uEkXQGEVh0WU1GnYbFSOqrDmGAM+/BliZfVUMOxhu
	zdx9xjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk2qB-0000000BJCK-30mz;
	Sun, 25 Jan 2026 16:19:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk2qA-0000000BJCB-2dVS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2246600C3;
	Sun, 25 Jan 2026 16:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D320C4CEF1;
	Sun, 25 Jan 2026 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769357993;
	bh=dmuDrsMdNI2PUa85stdWzynrg+qhR+Xfy0prFZxMHUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qWg9PrZdl2em2STRbIMp25vdm7gOVRgjhakz1mpGalssjaEa0iPiIkTWc0DkFLh+g
	 rvthJ5Jc7uEEHuzGT4C9rfqNTWMIz0nAKiqg9cRa6fgxIg9+YUG5yvRqBHAWbCB8bO
	 sx0lziWUAyK/1NzagmMNr/fAPTGfGQXvyQkTLVJHXn8hr+jL/G9rGC0V4J7P3RRDnl
	 InCPXQ9/OtnCd7oDNSDoetClBn4aYvO4gpGIhdt/Av9DBg/HGWlG73IdIQHn4szSx1
	 zlzukk4o/iV+66VEbfyvsyMsxps1JcAAf83z1zFOU7H7QZIkWOHE1XjG3r6ckClfeX
	 e8bUNvLSQM0Lg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vk2q6-00000005UFI-49u2;
	Sun, 25 Jan 2026 16:19:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v2 0/5] ... and FWB for all
Date: Sun, 25 Jan 2026 16:19:47 +0000
Message-ID: <176935797657.961543.17468025675313258219.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123191637.715429-1-maz@kernel.org>
References: <20260123191637.715429-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 23 Jan 2026 19:16:32 +0000, Marc Zyngier wrote:
> [Yes, I have since learned that FWB doesn't always mean "Force Write
>  Back". I'm not judging.]
> 
> This is v2 for this small series teaching pKVM about the benefits
> (haha) of using FWB on the host S2 page-tables.
> 
> * From v1 [1]:
> 
> [...]

Applied to next, thanks!

[1/5] arm64: Add MT_S2{,_FWB}_AS_S1 encodings
      commit: d4236f1ef270347b26ed34bcd0eb28d285b86bcb
[2/5] KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
      commit: 17d7b15131f3ed7fff29f2a43b6ead547e495653
[3/5] KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
      commit: a373930ec9406aeb9f82b5b78db56ca8d0919d99
[4/5] KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
      commit: 4f27fe82aa304c50b24f92da72b4895cf73b54ba
[5/5] KVM: arm64: Simplify PAGE_S2_MEMATTR
      commit: 65d00e37b17f46a21e7a25e0fb211a4c33274a83

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



