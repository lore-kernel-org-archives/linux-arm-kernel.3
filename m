Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FECC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/i8dlYbOpivZAfL2Q3eP0+7bhwO2MbB3pQXOtcJvmE=; b=LHmDzYRkOnxwBPEPxulSAisOCZ
	62TxPtIzVTF7e3AdON0rq0RWpQXEcEygHcnJfYkK2hJsc2Ynq3LN/TQtB6VucecYH1tit6evtBozx
	J6WzUXX1KW3sWJVWBn48q3paXb0hUZUOXeJGvijiAqNXd1OelvOR0qwQYaL+ms+QMK/5tI7HDq2vR
	FXb1VeUDfcOVE6f2Yb6uPXP7vrvp3l3HdYm5/r0TM3L/9jESqBhB2+T4MGKcZgWfPPOgik9BV1VDP
	hQdiCF20OR14yNxQHxV2lDWhkiojZFjCo8Ry9Qug7lClfTSnbuNLZm5a2wwpYckFQ9YPuaPck2iJO
	JA4+OhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Xu-0000000BstT-01Iz;
	Thu, 20 Aug 2026 16:23:14 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Xq-0000000BssY-1EAz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=MIME-Version: Content-Transfer-Encoding: Content-Type: In-Reply-To:
 References: Message-ID: Date: Subject: CC: To: From; q=dns/txt;
 s=fe-2eefaa527c; t=1787242988;
 bh=E/i8dlYbOpivZAfL2Q3eP0+7bhwO2MbB3pQXOtcJvmE=;
 b=bgqjfqcfswacr0w1K0+BugkGFqlWwi6R3ZzKQFf+QgGpLgY5xrG0NktHSKqZWZiZm1aJFQRtE
 fBTNqMkUb98J6URKcMKdk/Gy5O0dhi030cUkyTJ1RWnbKpTqgyyHsti60c1reTgQjt7XxkRKbyK
 dBeuPjtkgLA0I9Bv0/CUc0A=
X-Forward-Email-ID: 6a8729e97f958f0d9fc2403d
X-Forward-Email-Sender: rfc822; thomas_turner@talktalk.net,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: "thomas_turner@talktalk.net" <tturner@lineageos.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Thomas Turner
	<tturner@lineageos.org>
CC: "semen.protsenko@linaro.org" <semen.protsenko@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"peter.griffin@linaro.org" <peter.griffin@linaro.org>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
Thread-Topic: [PATCH v2 0/2] Exynos850 GPU support
Thread-Index: AQHdL9tywkiYFsT4dEim8C++1HK05bam/zgAgAABgwCAAACMeIAAHz2A
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 20 Aug 2026 16:22:59 +0000
Message-ID: <GVYP280MB12134B4DF9D6CA15C7867CF8A1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
 <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
 <GVYP280MB1213F9511E062056470AE74AA1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
In-Reply-To: <GVYP280MB1213F9511E062056470AE74AA1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_092310_442776_0BC64E68 
X-CRM114-Status: GOOD (  13.76  )
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


Apologies, I think I am missing the --thread parameter. The command I ran w=
as

git send-email --in-reply-to=3D'<GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVY=
P280MB1213.SWEP280.PROD.OUTLOOK.COM>' \
    --to=3D'etc' \
    --cc=3D'etc' \
    v2-000*.patch


I want to avoid spamming the mailing list with null information so I would =
appreciate some guidance on what I am doing wrong. In regards to your comme=
nt, I left it disabled as I was initially unsure whether the E850-96 Board =
uses Mali G52, however it seems all exynos850 devices share the same GPU, w=
ould it be better to have as status=3D"okay"  ?

As for the comments I believe I already responded to them but I am testing =
this on the Samsung Galaxy A21s and here are some logs I pulled.
[    0.230437] panfrost 11500000.gpu: clock rate =3D 377000000
[    0.230863] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[    0.230945] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[    0.231026] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    0.231137] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[    0.232552] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[    0.233172] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

________________________________________
From: thomas_turner@talktalk.net <thomas_turner@talktalk.net>
Sent: Thursday, August 20, 2026 7:39 AM
To: Krzysztof Kozlowski; Thomas Turner
Cc: semen.protsenko@linaro.org; robh@kernel.org; krzk+dt@kernel.org; conor+=
dt@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com; linux-arm=
-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; devicetree@=
vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support

Apologies, I think I am missing the --thread parameter. The command I ran w=
as

git send-email --in-reply-to=3D'<GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVY=
P280MB1213.SWEP280.PROD.OUTLOOK.COM>' \
    --to=3D'etc' \
    --cc=3D'etc' \
    v2-000*.patch


I want to avoid spamming the mailing list with null information so I would =
appreciate some guidance on what I am doing wrong. In regards to your comme=
nt, I left it disabled as I was initially unsure whether the E850-96 Board =
uses Mali G52, however it seems all exynos850 devices share the same GPU, w=
ould it be better to have as status=3D"okay"  ?

As for the comments I believe I already responded to them but I am testing =
this on the Samsung Galaxy A21s and here are some logs I pulled.
[    0.230437] panfrost 11500000.gpu: clock rate =3D 377000000
[    0.230863] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[    0.230945] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[    0.231026] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    0.231137] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[    0.232552] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[    0.233172] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0

________________________________________
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Sent: Thursday, August 20, 2026 7:28 AM
To: Thomas Turner; krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org; robh@kernel.org; krzk+dt@kernel.org; conor+=
dt@kernel.org; peter.griffin@linaro.org; alim.akhtar@samsung.com; linux-arm=
-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; devicetree@=
vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support

On 20/08/2026 16:23, Thomas Turner wrote:
> Hi all,
> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.
>

Again: slow down.

Why does this appear under empty subject thread?

Best regards,
Krzysztof


