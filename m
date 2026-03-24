Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC1AF532EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=; b=YeasqhQOtTTNPljeekS2vordiJ
	uX2MbbnwTmpf1/zhgj9ivRkq8FBE+6RDPBw+K8HQ2PD3PxyOfbzCJTMKefTSUYpJKFkJ2jH+ITT8N
	N/d1pMKhu7s8zQATIl62S7O1JmKepN+VOB9d9iLD0lhDX07JAhPuynQUUogFU8JxLRX0a7GbwUBaN
	H3ofja5mRDyZywpjISaMV8+McO1aUqQeoxGmTxLIuTjKY5V/qziKHLRHiD2rUmna8yEUPOWqb2Soc
	lfHZGlU2pQEX81deIIZTCUPiSgLzoK+p2YnEPNJMXjEMk4tyvpfRFDvmjo3Xn35SOM5GSBETnVU8t
	yiPakpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpw-00000000xje-0WLZ;
	Tue, 24 Mar 2026 08:10:04 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpr-00000000xgd-08d1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:10:00 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5674d8be45eso398529e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774339798; x=1774944598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=;
        b=B27hVlVyuN89kB6kik7/SKX4IZWxwoAnlt0CtOiC3zq4XsvhwMeLo21A2JYo8PdJIt
         DeJNOJe/z+0DKqLmHBiu2NHc7SHlq9ytSMbSY/84KqqWCRz61QEUGmD3ojYUXNEhKmQx
         +7v7HtlAMPK5IPh6AWDFjuDKzYt0OVAwUgv1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339798; x=1774944598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=;
        b=Ap66dguVR/gWBxb4wTConYggNQq65ziHKbqHij2XCWQ9gW6CleJnI/enLfT0OdmPLq
         JTHc5gTGYWsURlUcvDjNNv2eDTxR1WzzuawuUyeapbCCEDIckQF1LssbBpToG5WfyDLj
         k60Ya+RpES1LzWhHN3ON6qXaRikWp3KIZFY+n3T502r9yR8bLgZeHMfFjtnbFBmfuxzg
         ZcgbmWD4xMdJVLTbmMAEJf8jtpIQi3gu6ANoFkc9H/sHkxSl8eqYLFHhuoZ4El37iIWA
         pCdClWnxXpfQahT5KrCqxKYn9mhOpdsvmFRq8eWiebCVn82sRAK6+fdrrp7zbs6oWhuy
         CsKg==
X-Forwarded-Encrypted: i=1; AJvYcCV9tXqCdlBuA3dK2IMQ5rT1drv+fhY30szBGFBo2O34Ywdi2o/mIJ6fuqHQNPMt3epaHeSnTFRa7V3Ql3dQI7HC@lists.infradead.org
X-Gm-Message-State: AOJu0YxYWWaAvLh6UBbgiJEz6Eh+CTa7ldYBnxuzH25+SJ5p/O1eWoZ1
	jBxgr9+gCfN7eh9AJIuZnA6N9vDb5NhSn4dEUHlL+I1R6HENg7Pt1M6WTZSHKCgZNRVf+xBurL4
	czr8=
X-Gm-Gg: ATEYQzwqWLU0dzIESJGu/IWYRx0O6hPFSfoyFJqVT9ot64n74HRnkrv7HYj9Mm6h8+T
	k7KOiaST32uhzcNhN9+67xMCvgLGZ0S+CKsGc8YW48Y9Mg33MSkEhNUVPyBXsfIsMLwo8TWfqkf
	M3CpdSLGEqcOvR7/vOB5vBNvgHzi3bop3se69uFTOQz8v+nEplkFa1ohig66hiSp43rUvnoKwXR
	tVBuEoo0u489mO1XigSU9e7MH+tvv8rtTsHvJEQXqfrgb/lfUONCcOTjQgM/vsz14xlLbuJTY84
	jPd5uqtaX59ti4dn+wxTXmHgnCnn8WKJW7NiXUrUE8vqo0KIJ9hA/EX8ZJua3wM2nSABbMG3bnX
	18s4T9v/z2DhMJn9P+wMveNOhSfunBWAattIzaIY21Tal8n4cdtdoiDM7RdmgZKTBqiAsFHsjDp
	qU1twxw35EHUj2OCHqrYYAMYlOkW1jzwOaLcaWHKcvVUDh4XScuNW+Osc8WMMO9vlU9SyfpjcD
X-Received: by 2002:a05:6122:179c:b0:56a:ef89:34fc with SMTP id 71dfb90a1353d-56cde341b8amr6701454e0c.6.1774339797594;
        Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb939c2sm14354774e0c.6.2026.03.24.01.09.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so298497e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8S6yN0JolbRGpCp6vvO+tjWCHX/8gz0ZR0TXFKa1m923MDKnH68wjKmvazJOnbUOZlwOJwELM7uJo+SDaRAmH@lists.infradead.org
X-Received: by 2002:a05:6102:4b85:b0:602:95a8:c665 with SMTP id
 ada2fe7eead31-602aeabedbcmr5833303137.4.1774339796662; Tue, 24 Mar 2026
 01:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-14-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-14-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 24 Mar 2026 16:09:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhBREre_kOTjzbfodCQMHqd_fX=im9PFayv-gFyQHhL4g@mail.gmail.com>
X-Gm-Features: AQROBzA8Z-8iiIqSqMrZecLtNyZ6Np86Mk_AZ4ugqrIbZNBYNSNcAaxSBrLyCNI
Message-ID: <CAC=S1nhBREre_kOTjzbfodCQMHqd_fX=im9PFayv-gFyQHhL4g@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: mediatek: mt8188-geralt: Add little
 core CPU power supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010959_081048_51090C9F 
X-CRM114-Status: GOOD (  15.00  )
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

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The device tree for the MT8188 Geralt is missing power supplies for all
> the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
> Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
> is currently not working in Linux.
>
> Add the power supplies for the little cores.
>
> Supplies for the big cores will be added once the issue with SPMI is
> resolved.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>

Reviewed-by: Fei Shao <fshao@chromium.org>

