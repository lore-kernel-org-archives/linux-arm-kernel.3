Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB4DCA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gwemR1GkI6CxI+NqYHV23kvRhrEctXnUuljsqo+KfWI=; b=iSqcFko8QS8gc9Qtr64QgI5XlW
	f5SA/bwGg57IEx1i3Zwk+wlJ6dmyCZoWMYBJ/BLaQKIV4uFtg57gKWZSQ0ZGXsYol2KcwWWUv/yoz
	qlYFFETgpSvpG1CpL092UKzd98DifKv2hPZ1k9qHboFcSBZhakKLCvLisXBJtMQYgWdT009cS5ipj
	sFWLGtpezLNSHlVBfUShctBaVTNU7QyooiDYVAhec37/lDgm93dttox+2WSUXvG2MSDHAIXwHgA7Z
	NWs3JQsm77R9iKv58tOfjBaLCsJ3JNRe1PCGjTgS/YaT2nnQ5rVeAwJxUNrsoJUWu1j3JaqzNf958
	Y0OOMgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG98x-00000009iHZ-2vQj;
	Mon, 12 Oct 2026 06:04:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG98w-00000009iHT-2c3E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:04:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92DA860AA1;
	Mon, 12 Oct 2026 06:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 404CFC2BCC7;
	Mon, 12 Oct 2026 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791785053;
	bh=M7BMcVNH/mm93fZwim0d1Iep0hgAxA/nR3wZsPb6tOY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=m4VsCcsKvrVOdQxWY9HNU8QyZHf1JpZtmOnmCLU5YvZLUzWUZs+HyfbIC4PNSzfGB
	 Go5tZ8s+ExdKArfCvehYzrAWNZ+67OqV1fUdwLZH8h8V+tWFQcHNCHb6g9ph9VbD9c
	 7KXyr2zV/61eYclLN3gKzRt51bnVRYDPcAGmPSotlQgiPFIinttdKGTcaX+JzxNJF9
	 CZh1HhNifsZizA4t688ceJuzlm0t5h0IRq7LOl6pG94X+E0J8TEMGvYWnVhvYyyPu/
	 B/qSFpl9Z3nA6d7ECtwX11QbVnwevlLXZ4qLRevrrXWCHfw7k7D0OYJAswb4/ojoMF
	 f8n2vPWOU7mUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B269CA9EC5;
	Mon, 12 Oct 2026 06:04:13 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Mon, 12 Oct 2026 06:04:13 +0000
Subject: [PATCH] iommu/arm-smmu-qcom: Add SM8350 MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-arm-smmu-qcom-sm8350-mdss-v1-1-deae44695301@fromdisposition.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAyF4VchXdtkpoi3VzEuhmnRmgzIVAwJ4
 d0ddHe+xfkXMMkqBpdqgSwfNR36Ar+rID5CfxdULgZydPDOE4ac0FKacIzDtk514zCxGZ5539V
 HZqImQPm/snQ6/9rX2982tU+J7y0I6/oFhuIVvn0AAAA=
X-Change-ID: 20261012-arm-smmu-qcom-sm8350-mdss-9d4f37dd225a
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791785057; l=1459;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=g1QXs8w3o+qcZcGg/r4biOtnY2Etr8byKo19QjIIQdY=;
 b=rMMwu5/9HX4Syb5ShzURIreiL99EnXfdA0EEVWrjImfRhuJKBmFuA7eqgvYSj1mnJCdzstwSu
 zb58pWwpyyPAGu8/zwrsa8EmzhE/SHmMVNgL95MF1CERhwGoSFqN/jh
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
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
Reply-To: me@fromdisposition.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Demeter Barna <me@fromdisposition.org>

SM8150, SM8250 and SM8450 MDSS are in the list of identity clients;
SM8350 looks to have been missed.

Without it, the framebuffer left by the bootloader takes unhandled
context faults (SID 0xc20) as soon as arm-smmu probes, and the panel
shows no picture.

Assisted-by: LLM
Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
Tested on a Razer Edge 5G, whose board support is not upstream yet:
without this patch there are 10 context faults and the panel stays
black; with it there are none and the picture is there. This is the
same change as d149c8b2c014 for SM8450.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e..3dd8335c4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -425,6 +425,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
 	{ .compatible = "qcom,x1e80100-mdss" },
 	{ }

---
base-commit: 2888520bdcbe0599cfc77b2fad8dc6c95505a3cb
change-id: 20261012-arm-smmu-qcom-sm8350-mdss-9d4f37dd225a

Best regards,
--  
Demeter Barna <me@fromdisposition.org>



