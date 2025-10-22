Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC33CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC35CdUT3A8sztuK5L0Sfjwp3dV7/QYG5xsuOQkj92Q=; b=EGmPu8tQayOlEUIygkcZSsd+xW
	S8O2WthIyqtk4xnVjw7EVPdgzd/VZ9/kH7/wGSkC47AZKyvZPbnOXOcjxzQ6V+MLLK8cMw3zR9k1k
	NVt9ZAUG2oGrIycBgam1GLrT23dRKstxH9fhEOOQ8aQwkLMolbNd1Umm5+fgoJzvbYFFFemZ8HmsY
	sE2GecZBcCrr+CctxYYwBekGh/o8ONT1gKrAkBlPjQq9m9mfiuW4JtPsom3DnPILHWnVC7ZCR1i9r
	N1GT1LQFDkkcfNCNZwteMy4BmWomMTlHUV7gADnhFEgDpswfYgDPDCs9GcrqsFnd4mC1eLGjyIbfN
	JS1nQHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVOA-00000002J0J-0Egl;
	Wed, 22 Oct 2025 09:44:14 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVO7-00000002Iz4-3DaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:44:13 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8915bd01244so1018485885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126250; x=1761731050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC35CdUT3A8sztuK5L0Sfjwp3dV7/QYG5xsuOQkj92Q=;
        b=b+iBGLnpUvmWzRkPQ10yszlV2zOmaBNDDnHhJgFgdvsMMeUk9+Gy8Dzpj7Tg5T92ZT
         hjF6RHif38bde3TujkunqXNZkUqSreBGnWTeIJ+iEUS9XwXFPhjKXmJk5/YVrSyq8oi5
         C6UU4mRyix2zcZZ/UXxVvvitUTXXkqWzncu3/yXIpLIegCUqKWSSwOUfSyQAuZ30VDTX
         /kIk75J1M8QADqcdY4HL5DKd2HGVE/vG9m6M8CuTo8p7+cPXIenHzzh+Tr7qHIexNW5i
         fgkJTmyyCN7qvrlp4/ACoRVnrB8MauShoLxiyUMG9Ssgaahm2H+VXko54aQfmeEvARaE
         /ypQ==
X-Gm-Message-State: AOJu0Ywrp2ehxGLIxNXape6u3uNNxqz4qffy1gUyeVGLe1pf9ndWr9gJ
	huYunStxru8SlQujHKGjJAlRnnvj/codJN7BSbJBBCjo9K9sHuND6E+8FsktUNOX
X-Gm-Gg: ASbGncsdsfJCxMv1Gh/NrLt2OcIv8GIWy7TR8UBBeG8hQY043GNVpZNIL4wXPL3S3jF
	/Csggjdr+TQQUXiM7BxRtK5SlSqi1+hbSMt0MldjqUp4fDYhxovCcDrIiTbhRU/ggT24fLihWSW
	qUZucZNFvUv6t2hPZ+df9tjzdiCy1qbxm58DD11sDm9yiNtKv2hIU3x0q/uiRMYqg5qI2zuerr5
	B00KE0O8Ldftx0syax8PTlh/4Is5LkDa0UDGj77aiacVGuXI0jdRKfEOJZTaYtahGZ66TMS609C
	Uhjw4LV+E67Zs3HghnpggQDCUneq+Fb1Y+0KSFDET1Kn5A0ASoG4g2pQimTuQFGHEb7/ZItg64M
	jMHMa3ribAPZAhexeh6kq35O3DpZajltOjTnFfM1JXRYq77yVrn+/UE5Zkd3saU/r7c2P5khK3b
	akR9GDwnXj+LLoaovYqbPq6yMZz3BCB/iDLwjBf7ik2SiGDMSp
X-Google-Smtp-Source: AGHT+IGQd3Vx3o0kxpMcHkRIQ/S/3oAaGD4qFbFhflDsfuHEa2vLBR7hKVFzExvdQIE0Qsm0uKR2zw==
X-Received: by 2002:a05:620a:46a8:b0:890:379d:9807 with SMTP id af79cd13be357-8906fd18325mr2288142385a.41.1761126250254;
        Wed, 22 Oct 2025 02:44:10 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab104fddsm90055131cf.34.2025.10.22.02.44.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:44:10 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87c1f3f4373so123958316d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:44:09 -0700 (PDT)
X-Received: by 2002:a05:6102:d91:b0:5d6:101a:9f31 with SMTP id
 ada2fe7eead31-5d7dd6a12f8mr6743560137.31.1761125793941; Wed, 22 Oct 2025
 02:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:36:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW3j6BKdRQyNPYoZ8Y6zHgWKocncvOCFRnE+TzPDhpJg@mail.gmail.com>
X-Gm-Features: AS18NWA7snoGhRQxOaxa6kVLMYHHHQNhnIPgqBT0Sy_KqfLK2Lq6CACxKqN_A0M
Message-ID: <CAMuHMdVW3j6BKdRQyNPYoZ8Y6zHgWKocncvOCFRnE+TzPDhpJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_024411_858273_767C373B 
X-CRM114-Status: GOOD (  19.32  )
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

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
> for related userspace bits.
> ---
> V2: - Add RB from Conor
>     - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
>       maxItems count to 3 and power-domains/power-domain-names count to 2.
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string
> V3: Split up the allOf section addition

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

