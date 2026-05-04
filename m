Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693CFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 20:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF8Q6RoPGmOljbJrevjIunF771/iJgvq5ngDUmVs95E=; b=f1FiSWPPvT31hHSeX2b9hSXZCv
	XUMzQRFh8RXy8x/trKkE//VCVzDLWOC4x8v6bB4kbpxHIytP4rU6cA49S+x4S6njM5O8o1FkYSiY/
	i7aP+81NnZtPJQL25zZGkJFlpFtlh+gF3OvnBdlcOZEeaDjBthCpJPpQWhPaSjDETKgxqVIt+XmJr
	dAAlU+iuEfoKYs2Y+YSGwy/kPweokvpLihawlGAtWGBGJdOLf7Uih5j9j1vOsoTjFUAB4m+vdPClc
	DhxHBOpvD7TVtq0PODPaQjTKP1DJTZI2V5bdh7ZrKkyAapBHjx/vWVT+DKmgB3IlyFw44uc7rJwN4
	Yx+HIL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0DG-0000000EI7m-2Mjg;
	Mon, 04 May 2026 20:48:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0DE-0000000EI7H-3VFG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 20:48:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48896199cbaso40198985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 13:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927698; x=1778532498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jF8Q6RoPGmOljbJrevjIunF771/iJgvq5ngDUmVs95E=;
        b=rv13TU57i4C+iVFuiC5rwRZHtsIe++ZjTAnxAqc8IKUCiJ/4ez7xDGlFbCWQVdwOoi
         CuYJ3YHmoAGbCUibQOU+OY5Er/q28mWX73FGyPmQhgAcTCA+71M0qYm0/Wyily3ngiTW
         cV8WaIY5IX1Cb4u8fxVBtxxLFQJ8Jap3lE5J9P8pT8wvLCZuHxwPjkHcX81J2L18DA1C
         BPXIU4pEGv0XmQckIM4dV9+NpYLBg3a1lzyFfjm6a9jDyGhR5em5gDMuQ/w0yKjuSZch
         WKZuQTkfIgfZP4Ihvylv3J+/y6v2Fx4CN5FFgb9uBIHiYLK4+IJIfCvsR/VLydPjxc36
         bhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927698; x=1778532498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF8Q6RoPGmOljbJrevjIunF771/iJgvq5ngDUmVs95E=;
        b=Xjg0zRlx1Dv/h+RwlI1JRKYAtbFRcuTlhA1+TU1PRZfY4uQQpRo1ZeIH78rRS4CXc9
         ZAj0rdkaW6pxDWfXDBCmM2IOZueCsyscYlbEOh843kXiFuoWJf//m/HdLhKybTqa1nqR
         bONeG4oJ9GOEfzbaGT6tREij+EklciIk81JGGvhG/Uey+HYbcolIMxM7AmoYhA5ILZUC
         lGVFAlFAkM9a7Ul3t7nhH6BdiWhC8M8kKxpxkCeh4B5dxJ8+pqWm6vcEx8Y1yHdH7vfp
         XePMuu6GVS0Nw4dDrtIrDBnYDUqV3XugzzRnF2YAwJpPw7j6GVN8URspAEgJVpnDxcG5
         CIlA==
X-Forwarded-Encrypted: i=1; AFNElJ9tG7qr96wg8YkVj0lrTTp/2P2GywvuzBr5QQ/hrA+L3kBxXEfWSHNgTWEB42LyNnQzVgohDPLMyUjpNmYKm5dl@lists.infradead.org
X-Gm-Message-State: AOJu0YxOkrXmNeX9pIDcGInPxiUebXnwv6U52x9F+59g55OMCiIqg5FP
	scoB9F1bX7Iym8fFPve93TxsspAvHB5oxGlXHzgGg2tjNuwQOvgWC4k3
X-Gm-Gg: AeBDieutZ+XMBz7dtoVwaj9TLLisFhg+0RjPc8HNSSOxA2u4frzsPYrDWJ3A20poEBv
	cEw3//MvliFBJY0Svpd5ofmH+W2zEuD22H/29K0hwp2+NzFKpXldyanv+4k9jAsHdJl3CuU+0ne
	peN4GMJV7+XzjXpJm/FGpswyAGkO9QrzR5eVkK4b0hGggEVd5anV5NeHxPj6ojDsYWtQ7Tdn/PY
	jXqxZPuaGulaYZG1LpA84K5IbUj8ruksYKLfQkxam1YsjvCimZXklTppFlQ7FIi0V2Od6M/o+fa
	xJNTl4LFbubtjL/ikmkXJtAwI1T4yp8K87w/r1eAsIY9DtPyl60hgGJUK/kIuw5tbG46Sbtkr0c
	8V3yDeEmvfW4I8vsUJrAKGlnl6S0Y1anSF24+YW3cljbUhBcbjVTYSxJq+HNZ1yGEXeV5sY3FAg
	mlv1v5t3Exa9cCeKigCizd8IfCdW709EU+csV6oHAorDakWGLhXNxoIK4vYHUcCqxuXSj+BbnPU
	5RNsg1f2MCtDxMEHgGA
X-Received: by 2002:a05:6000:2586:b0:43d:7b7b:ab76 with SMTP id ffacd0b85a97d-45003fc719dmr750576f8f.10.1777927698004;
        Mon, 04 May 2026 13:48:18 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03? ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4502865baddsm38791f8f.3.2026.05.04.13.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 13:48:17 -0700 (PDT)
Message-ID: <05dd01f4-186b-4358-b90c-36dde16036c7@gmail.com>
Date: Mon, 4 May 2026 22:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/exynos: remove bridge when component_add fails
To: Osama Abdelkader <osama.abdelkader@gmail.com>, luca.ceresoli@bootlin.com,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260423200622.325076-1-osama.abdelkader@gmail.com>
 <20260423200622.325076-2-osama.abdelkader@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20260423200622.325076-2-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_134820_881698_07225D44 
X-CRM114-Status: GOOD (  10.22  )
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



On 4/23/26 22:06, Osama Abdelkader wrote:
> Use devm_drm_bridge_add() so the bridge is released if probe fails after
> registration, and drop the manual drm_bridge_remove() in remove().
> 
> Check the return value of devm_drm_bridge_add().
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> Fixes: 576d72fbfb45 ("drm/exynos: mic: add a bridge at probe")
> Cc: stable@vger.kernel.org
> ---
> v3: add Fixes and Cc tags
> v2: devm_drm_bridge_add instead of drm_bridge_add + goto remove_bridge
> ---

Hi,

Reviewed-by: Raphaël Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël

