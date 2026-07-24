Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA1C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVhVYNeSMyFFMXB09bCc3cSDgOhTTCeaRWg3rWJ0U+M=; b=4nX/UA5rBt98nRf/oxOppSeNk7
	ubksYlwyiwlwsNBbrMuSHsWIJAvSbok6XAyQXcVTpCHxYYoyAkHDG9Fq5atGiA8743pV1UMMvL1Oj
	gmTet4M36L6nhkWtKizAHvL3VWr7WlwUwY000m3JsWVxXP6XlPE719V2jLyEaIHB9Snr3JIKkTdbO
	fTbZsL/yBAfI2JRIEeU9hoz2CVEG/Euy9w8rNCsFpEKny1CbpGzx548EwGeeCJeuf1OzeTPnCZmGF
	pPie61yBKysvQXEHXTpwObmYZsvGD9tPe10nTZrSkE6t9toRYPjH0DgwYD05Sxweqc3Kev3UObVf7
	2pn/LMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD4V-0000000G6lJ-1W4m;
	Fri, 24 Jul 2026 10:24:03 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD3i-0000000G66b-1o27
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:23:29 +0000
Date: Fri, 24 Jul 2026 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1784888580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVhVYNeSMyFFMXB09bCc3cSDgOhTTCeaRWg3rWJ0U+M=;
	b=IZ4i7/idp6y3oteFX+MItw3b6Shtpkq2WCfKLx4IRdDGWY4W4O8XWIrEO65Fqbjvy1wCl2
	nW8ifgPytr3eY1Yw1mpmscEoKpe48lUx9IxRJ7JfWFNI53zZdzo55voXZgzmMIYaHczuBC
	A4wA2GSfirwI00CN8+WgWxbdXHGaFWOuFoY9Fx0tz2EaHdwz2drjFZfg0zTT1211IC6TBH
	F6Rmop7WUQK4uN/v+eZ/9c9lhfxbixR1ZgSG0dn7TnGx6ZE99NFY5ODecgf43zcMO5jjbO
	q6a3FnSlzcaamfLV9UreCIniGLrTExAO1gCHkbKx7S4KVKql3k9CvPD9nt5yMw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH v6 2/6] firmware: meson: sm: video firmware loading via secure monitor
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com> <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-2-6072a7ee7428@amlogic.com>
Message-ID: <tiocu5.1w1r6qwzlmu6q@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032314_636157_494D743F 
X-CRM114-Status: UNSURE (   8.72  )
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

Hi Zhentao,

On Fri, 24 Jul 2026 07:04, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>From: Zhentao Guo <zhentao.guo@amlogic.com>
>
>Add SM_LOAD_VIDEO_FW to the secure monitor command enum
>to allow decoder drivers to load firmware through the meson_sm
>interface.
>
>Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>---
> include/linux/firmware/meson/meson_sm.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
>index 3ebc2bd9a976..3b90b49d0552 100644
>--- a/include/linux/firmware/meson/meson_sm.h
>+++ b/include/linux/firmware/meson/meson_sm.h
>@@ -15,6 +15,7 @@ enum {
> 	SM_THERMAL_CALIB_READ,
> 	SM_A1_PWRC_SET,
> 	SM_A1_PWRC_GET,
>+	SM_LOAD_VIDEO_FW,
> };
>

I would include this in patch 1/6.

> struct meson_sm_firmware;
>
>-- 
>2.42.0
>
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

Best regards,
Ferass

