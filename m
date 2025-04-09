Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356CAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4QJ9T1jJTgLMKjryvYFGaAAsSBU5nSvxWqBT0+b8CA=; b=Fga9z2RGTlW636dFsXrc35cqws
	V6O6Hp+dLy3zkS4rKv+CKfpMAuLIGZK3H6LtUkERykfHGcw3DQog7m3Q7ABRHLe7ueXSllCT2AlGy
	Warflaby7l1Ldft8xjoymqW3bGfB0KLm7tah0Vu7aG5meDdLh0qhM2pjk9PYLpLDMcrn3BAIGadFZ
	LcCf/4O9ASKfPfyW79U9MKAUbuNRHWCA9pibrmVOXLIY60bQgxI8c4Xjt1qof+o1smD33qxDcjLqP
	Cb3qvPK46psgofK+YUC0UHub4orUgioyv2mD4SNagmjbqOWefV1/SNSayXiXPcCJCgaNkKGGZ4RKk
	J8YjA39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RBO-00000006dn4-2yl1;
	Wed, 09 Apr 2025 08:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2R9d-00000006deC-1KAO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 08:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z4QJ9T1jJTgLMKjryvYFGaAAsSBU5nSvxWqBT0+b8CA=; b=gkBsHz84ixp2KDJ5qm3hjtk1z6
	2+wepC2UDH7cpS9lmfWeZb940H2+ZohEtuL89ado9w9t+ziSBoA47I+q4BNa95GM/+ipzlQ2cYoZo
	YWR2txh+oqkJdhrAd71NmQywhzIiDu590JMg738lsaShIt0+0hwCbcUxh1blSCNakjoCGKAnEI9wQ
	aWiSdAyHvDL19sbFj/DqbMOAp0w/aHYwiv3fhP/W3hR0G61VD9i0yWI1qjvjzlELoGcCsxpRF/HLm
	unOoPiE+xcBMK/zC/11OwJh385xtDN6p2U/Xs4G1wWiB9nSYYY0eutVwuWU8FnumBsbbqWcDYVfGY
	mja7iBQw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2R9a-00000008YVH-0E40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A58635C4964;
	Wed,  9 Apr 2025 08:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735EEC4CEE3;
	Wed,  9 Apr 2025 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744188683;
	bh=AL5W+KRUqaJomjLaLeEEJHtcXw0BSUHBCWmlwEEAeeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJXY6lsz5OMOeMj5aFUOGvH4/cXFTMy98fHqjKBXPn6omJo8XPcSMFbVhpzjfvhzW
	 ymV7kkvFMyDUReKBV81qFzDN95WZlmJbWrj3ycxUOGkLovmm25el8igW9gbjIUfOQE
	 fv91KZN1oP4bdxPED3xp+DXE/KsEYaSc05uekioxLanU2Xq+8B/DP8l0pKs6ucQtPB
	 OgxmudNHQgpt23WESrBzQcOvtRiHeu29qTjLmr8aQ+USyLnc+cKTpOyKW04KAeuOIB
	 rUlHWKByGkltuVevmK7ewCXZkoWs3y3k9QkjnmNaY0icuCJNsKe0Lm5ZHMH2AqDiep
	 jZiGSMYKyAGfA==
Date: Wed, 9 Apr 2025 10:51:16 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 13/24] arm64/sysreg: Add ICH_HFGWTR_EL2
Message-ID: <Z/Y1BCFxBwV97rV/@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
 <a1c79f36-322f-4444-992b-1b69d8232124@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1c79f36-322f-4444-992b-1b69d8232124@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_095126_533194_6FE46777 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Apr 09, 2025 at 09:48:49AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> > Add ICH_HFGWTR_EL2 register description to sysreg.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> No comment on the contents, but I feel that having ten patches
> adding new sysregs one group at a time is a bit worse than a
> single patch adding them all. The patch descriptions don't add
> any particular information about why these are distinct, and you
> need them all anyway, so I'd suggest combining them into a
> larger patch.

I posted them separately to simplify "reviewing" their content,
I will do whatever is preferred.

Thanks,
Lorenzo

