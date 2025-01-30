Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BBCC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P85b1Yewhr0bG0AVZgypW6WQK0tyFtk1cdyI+K42D8=; b=KkkjLoA4/NngeiYxDpCl46qQb3
	utejUhZmIHGk4gSLJ/QnMBgoLEEijYALcOYCMs+kZvH9qYi0sACGED5AybC7EMpTO/6JJGvP7KAdh
	dVn43tG1PfUwGN+CY7wl2icmTfhmIYzXx/QX/iL7yG+QT1FrLJ8KsWZiyOFeK89xFQ+X75QeBz77m
	tu5R5maBl3q2mMTuCIlTOD9gV5fKrblTtQUIB9BJKSSlvrpHRXlMmbiRlz2FkUiNbbbChcg/7ZnFC
	GQoQKmupgVvvdOes78jcg39c7gJNXMeTi31CQ7NmxrFXszWwUKOlnaE52+S2/IO/deTIHUIloibon
	LdtdDKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXcn-00000009BmH-3Xw3;
	Thu, 30 Jan 2025 16:42:41 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXTM-00000009A7W-1Z7n;
	Thu, 30 Jan 2025 16:32:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738254761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Afs9I66P4nPDOHHXiYSbFue8gfjFNvFdsY9Ez4F6h2G1pKI1oCAbFcGK9hP63OYYfW9bDL0NuJe1wi4WxvB/L3UreF2Vq/SRXk9dM8IKigtru9T+1dQ93H80EVX74NFDv2lnORKKoUG8xhl5RExjGa4U6lj8Jt9PulpcXNOdUhU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738254761; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4P85b1Yewhr0bG0AVZgypW6WQK0tyFtk1cdyI+K42D8=; 
	b=PW63N3zADGMcw5WzavUGXAqwpDQ+FHjxDE7juX8eKXR08Mbe9ftY5y/djcypmTkICp82A0pMzSAA+bjExZTbPzFVFuh3vDx9RoPmSEU7auDBFHFFVWw5tmBQp3bS2b82BijXA1lwKB0Az1S9Ktwm+FmJorXVd7IO/hqsaaB21WQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738254761;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4P85b1Yewhr0bG0AVZgypW6WQK0tyFtk1cdyI+K42D8=;
	b=jLm1UI5rW3l+RWZAg/nN290f1ftUNWa4KyJwUIooqu+hquGkCsbfFP3H9ptklXB+
	lm8MUSjF9awrkFDjNW2tpsDEkhgFPMlGSqyGx3MoImrycN9OF1z3OfCe3lzmQR701SF
	vWf92AEaENaoVroKisWvWveuSQJMPtolkXMJ8Amc=
Received: by mx.zohomail.com with SMTPS id 1738254731433421.4839172231101;
	Thu, 30 Jan 2025 08:32:11 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 30 Jan 2025 17:31:21 +0100
Subject: [PATCH 7/7] mailmap: add entry for Nicolas Frattaroli
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-rk3588-trng-submission-v1-7-97ff76568e49@collabora.com>
References: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
In-Reply-To: <20250130-rk3588-trng-submission-v1-0-97ff76568e49@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_083256_478184_02E51A8C 
X-CRM114-Status: UNSURE (   8.47  )
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

Add my new Collabora E-Mail address as the main contact.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 17dd8eb2630e6216336047c36037a509beaa0731..07dc4846c451d0f36e27fe67e224791cd48bfef9 100644
--- a/.mailmap
+++ b/.mailmap
@@ -525,6 +525,7 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
 Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
 Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
 Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
+Nicolas Frattaroli <nicolas.frattaroli@collabora.com> <frattaroli.nicolas@gmail.com>
 Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
 Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
 Nicolas Saenz Julienne <nsaenz@kernel.org> <nsaenzjulienne@suse.de>

-- 
2.48.1


