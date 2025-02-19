Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33125C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiRvNDTo4kWuR9HPpIK32zQqYJjr7HL5043eyAL9WwY=; b=FQbdPAX99K9AL4/01p039y22gC
	nqDEV5v3vLrOa9HCIoM2vbWF0ITXiFF4YqJd1QiKgDMB/CCr8c9ga6r9PG8SnZpF0a4ZX9vTuNxOL
	gC7e5HlL+avkGOjR0jmefHD9QQd/Zoa9+Yyghz5W4nJ1U8fx6t6ooOQEjwZrXIYTA7n/y94kVNYXa
	Y1sWVdemU5GWuj2ezKdPcD7RnMCJNtcHGgXc0piKrJwH9/Q6KxLXvewN/qjO2ew37Pimc/CAIar/a
	DhU4rNLIpwq1h5ikEotr0NgPYWHf3m7o0NSXtju9ItvBW1YKNirCvWfKoIEyQieZYlCPrCeqPxWT0
	0FcDfLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkm9U-0000000DaXy-2SkX;
	Wed, 19 Feb 2025 15:38:20 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkm7z-0000000DaDX-2zmo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:36:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A4A5B41EF0;
	Wed, 19 Feb 2025 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1739979403;
	bh=oWWajixtlHPEE9PFDS//yTG8eD00WLGc+jcUF5caSKk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=i76W0ndt7R0fdW2YCSE3r1spun1yeZRuV/w3I70GnJAOje6cLjmNW98433Lsp1ksv
	 PAzTB8VxQj9/UYbbJc04urECHsRIzu18/+mS9ea81cpuso9T1XEAFKFDUmOa8RRcc7
	 E/dmjZLb2LPZYwu07I52yh99eojtZAEEzy9qPzna1Qrka2hkJPQ4mcvWimQpDSEoHp
	 qg8I0sLMoCN6L/8uggRmes0lGUFgHgdZIERLJcE5y+1bbNnIgYWe9Hko4mx2i/f61X
	 RN0zOC5s8GPEBveJDrEkIpMEVxBALGdchdJaNtzcfOlXr3+Uem4DL0rMV8+/t0hQVv
	 p7wouJCPeJv5Q==
Date: Wed, 19 Feb 2025 16:36:41 +0100
From: Asahi Lina <lina@asahilina.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/5] media: dt-bindings: Add Apple ISP
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMT+MTToVdm72ovNZ8ySySYe5fT99a0Y6bv02NKxADCBCe+pMQ@mail.gmail.com>
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-3-6d3e89b67c31@gmail.com> <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org> <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com> <20250219105326.GA31383@pendragon.ideasonboard.com> <CAMT+MTToVdm72ovNZ8ySySYe5fT99a0Y6bv02NKxADCBCe+pMQ@mail.gmail.com>
Message-ID: <252808F9-D1DA-4233-A878-5C47595302A6@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_073648_186228_447E3C64 
X-CRM114-Status: GOOD (  14.93  )
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

On February 19, 2025 12:05:29 PM GMT+01:00, Sasha Finkelstein <fnkl=2Ekerne=
l@gmail=2Ecom> wrote:
>On Wed, 19 Feb 2025 at 11:53, Laurent Pinchart
><laurent=2Epinchart@ideasonboard=2Ecom> wrote:
>> >
>> > Those are board-specific and not discoverable via the ISP protocol=2E
>>
>> But they are settable through the ISP protocol, aren't they ? For
>> instance, looking at isp-imx248=2Edtsi, the first four entries are
>>
>>         /* 1280x720 */
>>         preset0 {
>>                 apple,config-index =3D <0>;
>>                 apple,input-size =3D <1296 736>;
>>                 apple,output-size =3D <1280 720>;
>>                 apple,crop =3D <8 8 1280 720>;
>>         };
>>
>>         /* 960x720 (4:3) */
>>         preset1 {
>>                 apple,config-index =3D <0>;
>>                 apple,input-size =3D <1296 736>;
>>                 apple,output-size =3D <960 720>;
>>                 apple,crop =3D <168 8 960 720>;
>>         };
>>
>>         /* 960x540 (16:9) */
>>         preset2 {
>>                 apple,config-index =3D <0>;
>>                 apple,input-size =3D <1296 736>;
>>                 apple,output-size =3D <960 540>;
>>                 apple,crop =3D <8 8 1280 720>;
>>         };
>>
>>         /* 640x480 (4:3) */
>>         preset3 {
>>                 apple,config-index =3D <0>;
>>                 apple,input-size =3D <1296 736>;
>>                 apple,output-size =3D <640 480>;
>>                 apple,crop =3D <168 8 960 720>;
>>         };
>>
>> But I may be interested in capturing a 640x480 frame with cropping only
>> and without scaling, with
>>
>> input-size =3D 1296x736
>> output-size =3D 640x480
>> crop =3D (328,128)/640x480
>>
>> Or I may want my cropped frame to be located in the upper-left corner:
>>
>> input-size =3D 1296x736
>> output-size =3D 640x480
>> crop =3D (8,8)/640x480
>>
>> If I set those parameters through the ISP protocol, won't it work ?
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
>
>For cropping - you do not want to change those parameters, the sensor
>is partially occluded, and the crop area is specified in such a way
>to not expose those pixels=2E As for scaling - we can expose only the 1:1
>scale and let userspace deal with it, but it appears that it expects
>the other common output sizes to exist=2E
>
>

The square sensor with the hack is the IMX558=2E The configs there are act=
ually a workaround for missing ANE support=2E

What the driver is supposed to be doing is using the higher numbered prese=
ts, which crop internally and exclude the occluded area=2E But those on mac=
hines with that sensor end up requiring ANE integration for denoising and I=
SP crashes without it=2E

Config #0 doesn't use ANE, so the crops are re-creations of the other conf=
igs so it behaves the same minus the denoising=2E

