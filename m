Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74254C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWhSVJVORFM0nmb44FtaW2rLu6vW8nVH7CmnaXSUUlY=; b=mKArKyYsQ9O6wjG2z9epDvIAho
	lPHQ512IvyPxWBfTlgQBSR0BgGspHCPUZjMTARDZWTXab3SeV2ozMZcaREmL318WB7WX3h6unpRAm
	jNHSIbDG6LS80zMG3vlPro0rjNrTPRZ84gN715qXBxb/hqziQqGtv1+Cdgu3Vyi19Y1tYubGiNeLf
	Hb9MaohBV/IktapcJ9qbY0lJ3yNgcsJDRMDAvt6C2bBP38doCuS9J2P2qOcfsAc/jwpQZTQCGrUbb
	xTPHx5BsfB/19zk/LbeOXIAOEu8AkX/jjEHufVAFOtLpgXON1Bm80dD7Hl1k4h+sINhxPD6m5Nixa
	cXO0I8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqol-0000000Dd0g-1SIe;
	Mon, 06 Jul 2026 21:25:31 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqoi-0000000Dczz-2LHJ;
	Mon, 06 Jul 2026 21:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783373126; bh=RWhSVJVORFM0nmb44FtaW2rLu6vW8nVH7CmnaXSUUlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MpTHLDMf6w4zJ8tCB4YVUh06nMl3l9QCUpYqfRSp8H0Q7yA14nxkJ/pI3tSCxEe0i
	 dtx1g3h/8xTeqXGoX8r4LlFOVxpr8X2qhrlpD/KIbgo2sKZ6x3aJwNhKFsM1WdFsoP
	 CNeeA3pbe04Hob8q1AzUVBvOp+JAKow7skOs/Gwg=
Received: from AERO17.taila7786d.ts.net ([220.171.158.107])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6571E26E; Tue, 07 Jul 2026 05:25:23 +0800
X-QQ-mid: xmsmtpt1783373123tq31asxge
Message-ID: <tencent_3C137FCC795067C558C9C8BD86C03C180006@qq.com>
X-QQ-XMAILINFO: MZtEYADUG4AgQcDlRbWn1WAYZSJBgI9Ur13Tuyix8/SlyXAxMGATkk2TqiTkWi
	 cd9D+8sLM3rvBNt2nAE7U2MKbAkBLIIdiWO5NpFcVHLReRy3G/F1ntrcewIwGoGc2UBRpgBieu9Q
	 vn2qWspL1HxLiDycBA2G1I85B/440dKVV+UY31gGM0qaksP00AY9rHvY12a7Grrrl6XiQig7WOS0
	 D6nzKkSg+RfUBSElxCvORLulzUR3Dvvxxi29V6WFPQ92I8Ext3n8V0Y2112k1Gqw4gd0OI7sVCip
	 8DMwRSvjx+Ip1PdRVpmAYoW9Pu7y4EYZ80RMoJ7XH7wsI9S5Gx+pOfBj8pWdRnZlH1F1rK5LlqDJ
	 +mT74c7RXjzfvdIkBCccXnynkdMefDK5QLmzNrH+0q0rbIKsFNOPqAITrCTJ+fxrfUWrb0qq/jov
	 t1L5h3MYHMsLMS0djET+/AxjSL3aHjc+Auxr0OaSRPALqpdFR4uqHJErLHQIw6O/fZhaTFUKLgkB
	 hArBfdIo2XRfvIkAK/njoCtJeIuscGzXFs+at43BZVU5h71osTuuiTEi9rjEy+jKVvl1Fzositcf
	 CWwf/Ro05ptkWLkLmpXR+Afoa0t1YbexlMOeJpxL0CPImp4LHja6jacg6SOfnbEFNJi7WcPGV3In
	 Xc1XBp0ApgaPeE0OAS4rhi1YV9sztw7XLWdIzSJZ88/DPEpOdaFiLNuIfUET/O5w8CpXVFyQZ8tv
	 UuDTWevZdGWK3Un0rX3ZCO2XpJYW9N97yGQw/ss8C9P2BIpbDvHZ2w2TbBMvC2VsggNZqIjVry+G
	 5QwlNONZ2EE0dPH3QrkbMxbu9eMBoRVYfmKiBdfSzkw7b4P1qjJ7AYOMFhTe98l1vfEnnJ10Nhto
	 co36NeFmqMvVG7FypqQhkZ1LRs3LKZ1OFzNjvt3kM+r63OQfdMb8LuRCfPSLtxycMLzJyFSpPQTq
	 X9ebEL60O637wcDdLcX7s624vDWd85k5ksmJWj0X8b4rFIfbNXsFVOWZo3qMmTguAhh58+0wBVMO
	 amNrdRZhMGEw1h+L8/t+RH2rFNup4CNRWZ3XVKYggtrik/V8WvIPxXquI65kE=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Tue,  7 Jul 2026 05:24:28 +0800
X-OQ-MSGID: <20260706212429.691312-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705-matriarch-epic-37add5cb97b8@spud>
References: <20260705135014.1004166-1-2254650260@qq.com> <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com> <20260705-palatable-hardening-48f73a84244c@spud> <20260705-matriarch-epic-37add5cb97b8@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_142528_914750_497AA11B 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On Sun, Jul 05, 2026 at 03:38:00PM +0100, Conor Dooley wrote:
> On Sun, Jul 05, 2026 at 03:37:00PM +0100, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>
> Actually no, I just noticed you're not using your real name/a known
> identity. un-acked until you sort that out.

Apologies for the confusion. My real name is Jin Pufan.
In v2 I will change the author identity to:

    From: Pufan Jin <2254650260@qq.com>
    Signed-off-by: Pufan Jin <2254650260@qq.com>

(family name Jin, given name Pufan; using given-name-first Latin
order as is customary on the list.) The Copyright line in the
DTS will be updated to match.

Thanks for the review, and sorry for the noise.

Pufan Jin


