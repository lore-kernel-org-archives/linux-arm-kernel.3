Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A418CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hzjx4BXSFGwYA/atV/BPIllY0q3ocNurdUg55khfjuU=; b=fjfwiV0R3laN/T
	LLhVhLAUJTmNbq4zwXCWhz74XHVL2KpujQ13Vym3U33YX0jJ9zv6TalMt62Uib21abkcG86gKSUbX
	qCs5mj6SdN9V2jLNzneuB+vK0ftvyYDtiDtQ6UpmwxWHVHdRCgVj+Fe5ifKzt/vVG39semNCCKJsy
	nYE2BV70RsGDumTTHX3ChCUfUZ83coK8yKL250yIPUwmR+oeuybC9RDFs1w7uZSuNWL1iU08Imux7
	vUHk4i6MSuBOVprqiQYI9coIIRc9YRu58nlquG/oHzngS6TRc5hPdOtn3Xm7O9RHvnDHK4Ju3oHIS
	Dhry7w/JrMcLymy67djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjhe-0000000ELd7-1qvm;
	Wed, 05 Nov 2025 20:01:58 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjhb-0000000ELbp-44CO;
	Wed, 05 Nov 2025 20:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1762372912; x=1762977712; i=frank-w@public-files.de;
	bh=Hzjx4BXSFGwYA/atV/BPIllY0q3ocNurdUg55khfjuU=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bNJcTs7dCWG8CPetc7mtf/dF+IZAeCznqS+mFSZvcqvLtPbQambz1IB8Z3XFEa4c
	 +hinrHWy13rHiK+rczzk9gkpwQU1X3q/6RqQ5Vk1zsLpRcrnRF+5aPraf53vFqoIL
	 GcTjnmyjx1jVh3XPqhMMgOhW7Q2lb3zBUloAGYVu2kaRKrlGSqBVhOLii7tJeRYq/
	 hN4vrzFZko88l2aPVz8T7zAPM8iLNRwg1pWbIFEuV7l03Aj7pbRQbo65X+wEzukNe
	 GEuHn/Y+sgb1o1Wd0u9/qvTZFSSi/eeA2qr/TszN+zf9orWB0HWYW/fhmSFHkiqrD
	 x4sE0KjRDmxLDQ5hLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([194.15.81.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAgq-1vnaY41MoS-00jxtj; Wed, 05
 Nov 2025 21:01:52 +0100
Date: Wed, 05 Nov 2025 21:01:48 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
User-Agent: K-9 Mail for Android
In-Reply-To: <20251105195007.199229-2-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de> <20251105195007.199229-2-linux@fw-web.de>
Message-ID: <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iUPiY2cHdiqX29lxNsrrHZtcxxb1qh7CNYQkt2T6scUeSRLB6ZP
 pYLY6f9QD7JEVJMPGk47GJFIvanLSS8nXHMBNWRr4kw18M8emi0Lk6KUTW1GM0SDf+CODhw
 wdwPpFGKZsCqsl9vW9tY+bvV3zoMrPN0hDBf+MrzsZs3Qo/DaPpuIjFBoWR7uTFsQ1s3F2v
 4Stu6WVgwhaJaB83PpA/A==
UI-OutboundReport: notjunk:1;M01:P0:DxHkrlkbtsw=;S3Dfr2nBGdMetKiUAMjm6jgpjBe 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 eBxiofd6tR+TN+li99i6gDa3ng=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_120156_289921_2A7CFF31 
X-CRM114-Status: UNSURE (   6.72  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 5=2E November 2025 20:50:01 MEZ schrieb Frank Wunderlich <linux@fw-web=
=2Ede>:
>From: Frank Wunderlich <frank-w@public-files=2Ede>
>
>Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro=2E
>
>Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>Reviewed-by: Krzysztof Kozlowski <krzysztof=2Ekozlowski@linaro=2Eorg>
>Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino=2Edelregno@colla=
bora=2Ecom>

Seems Angelos RB tag is missing "a" in "Gioacchino" in email

Got error:
said: 550 5=2E1=2E1 User does not exist -
<angelogiocchino=2Edelregno@collabora=2Ecom> (in reply to RCPT TO command)

maybe this can be fixed while applying?

regards Frank

