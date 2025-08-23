Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18389CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FME8LsC6LsbRGRS5b/3/udJ7zZvv4zbkizN/R7jJibU=; b=sz6etLawIB1gYVkaVP5FVkPzw/
	07at3wv0dnsb4qCYlSdfkJTwF0Y91qHryiJZG90kBUWQuokTpQ5tY+julirkr3sFF0v5MWx1ACE4a
	r8HDVNiORjxbEWVi5msN4PmUWr9IDAx0ZfQn6iJpwVsZHG0j/+F1kt1gG6SGuT0ESdRpQ11aDpvxQ
	g4ZKbYuKg1e7EOhq9dGjOVi8YdKS3iVMD8+qTo+Roimfg2x9lIUwQ4IoFPXua0AIGmLN+Nv6vAYp2
	EWB2kDP2hEJDfrR7SJTaJIFNjUQlwvkOfOulek8kihsnDng22h61aONHB+ehZyhpdMt7AOp2V/qim
	NDP/gRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqL6-00000004vaQ-3c0Q;
	Sat, 23 Aug 2025 15:39:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqG1-00000004vDK-1oCP;
	Sat, 23 Aug 2025 15:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FME8LsC6LsbRGRS5b/3/udJ7zZvv4zbkizN/R7jJibU=; b=mq0LR1T2fLLkkWzMqdmxoGsrjE
	T9l66Bz93UrBl6D6Jv4TKfUunH1LvN4GEtMROvJhf5dENlMuwS8eKGGQRUyPBPG6f9ZpHVJF+gSAq
	NYUIW1LT4Y2AMEFJaHj9QL40PGy9hvA3etdIwwVmCWO/3fB1OhWGPoCFyRniBuHI82LaHUF8TOtOI
	F4F5HScFpEcZB8+Qy/JJMyXqN4VMPjuRkDdz9wYugP08284QNBiuP8mq6bmOMGoPLaIgX2VG4FTph
	bmV5VHCzSiQe+YdHo9KP91SqjKfYkr4HJZFB7kLOeOXkKevcgxxWZbO7dzsql/1tVIEHlL35pkK0/
	1h7PojNA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqFy-00000001Smg-0iB4;
	Sat, 23 Aug 2025 15:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D18305C2731;
	Sat, 23 Aug 2025 15:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E69C116D0;
	Sat, 23 Aug 2025 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755963250;
	bh=kTALLSkXGcreCjIk5ouErmIww5GXzdh4sJZ7jSXzRQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fFWJB8rUZTR7k1mJNnrOp0U9u6ycN8+Jk8coMcewCtLpogIycNkCI8WXsKET7qRB3
	 pltxGuwxlWfyUyFzOT0Y6UANrSTTY7h+e7Tt0uYdoSK+vN5376+mmga3ro7rt8AcKd
	 xQeJ4b0D11X7cokEVT6D+Z06sQ8efpan8xGj9KS3eAJDbUK1HzkS7xhEKduqugylqf
	 1arOlaqD4Uxogfzbl2IJUvMpwbuKakn+ZvTkXngEoExybeS67OA8uzF4u11pZkOjbu
	 gabqZmJULI6gjywr73jsXKqhTv55m20yYbXP/ZS7VRp5XfoQGy+1vh8OUMFiyHFlSG
	 plEWMicPJ/Srg==
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so2951049b3a.2;
        Sat, 23 Aug 2025 08:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXuj/HaEZIEVANgxNP/nwVdK93a0/DSpGYNSqc5TBrxQtzdrWqLAkgFXnEBxVHOKXLJojm5GQrMfNPAauHMI5M@lists.infradead.org, AJvYcCVr+HISb2RCmHtfBmelqOHFJvSMFEoyesc5avDkLXvkDYe0UYhvP6OruVvbnsLLaoI5Tg6e7+MmHQ9MtIfP6so=@lists.infradead.org
X-Gm-Message-State: AOJu0YyP6rN3QeRrU28KyKu/f713ju9C+fyq41TeNBnpJLCf/k8NDqTO
	bEaxiolVORtPlM4jTQeYbOMQznRK8sxQhU00zZxOjSxZHK7dA6Xba2a0K4FyitpOwmaUH/rtjj7
	RHEVFhwmPn/p2zscDx2BLEfUNs8kOdA==
X-Google-Smtp-Source: AGHT+IH4plAM5KbETmxDDjvC+xXEie7PQ9eZg3ukysPt7y/ninQ9lLmP959MYy/IC7jqNGnL7Y1cqkNrWOy3mIJtmoY=
X-Received: by 2002:a17:903:2012:b0:240:2145:e51d with SMTP id
 d9443c01a7336-2462ef440e3mr63417535ad.31.1755963250030; Sat, 23 Aug 2025
 08:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
In-Reply-To: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 23 Aug 2025 23:35:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9mS+VRu9T45xawO-jdT0Zk+JR3XMbj7So3LuiUfO8_0w@mail.gmail.com>
X-Gm-Features: Ac12FXw07uZw-AZ_HWLRa8XVVMEzzj7o_IkjPil9tjxcN8KsqqRfui-EkO3JR-w
Message-ID: <CAAOTY_9mS+VRu9T45xawO-jdT0Zk+JR3XMbj7So3LuiUfO8_0w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi: fix inverted parameters in some
 regmap_update_bits calls
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Guillaume Ranquet <granquet@baylibre.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_163414_517438_66D9E33A 
X-CRM114-Status: GOOD (  13.77  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B48=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=8810:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In mtk_hdmi driver, a recent change replaced custom register access
> function calls by regmap ones, but two replacements by regmap_update_bits
> were done incorrectly, because original offset and mask parameters were
> inverted, so fix them.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: d6e25b3590a0 ("drm/mediatek: hdmi: Use regmap instead of iomem for=
 main registers")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 845fd8aa43c3c91659808d9e6bb78758d1f9b857..b766dd5e6c8de6d16bff50972=
b45c3c1a083b985 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -182,8 +182,8 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(s=
truct drm_bridge *b)
>
>  static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>  {
> -       regmap_update_bits(hdmi->regs, VIDEO_SOURCE_SEL,
> -                          VIDEO_CFG_4, black ? GEN_RGB : NORMAL_PATH);
> +       regmap_update_bits(hdmi->regs, VIDEO_CFG_4,
> +                          VIDEO_SOURCE_SEL, black ? GEN_RGB : NORMAL_PAT=
H);
>  }
>
>  static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool en=
able)
> @@ -310,8 +310,8 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hd=
mi *hdmi, u8 *buffer,
>
>  static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enab=
le)
>  {
> -       regmap_update_bits(hdmi->regs, AUDIO_PACKET_OFF,
> -                          GRL_SHIFT_R2, enable ? 0 : AUDIO_PACKET_OFF);
> +       regmap_update_bits(hdmi->regs, GRL_SHIFT_R2,
> +                          AUDIO_PACKET_OFF, enable ? 0 : AUDIO_PACKET_OF=
F);
>  }
>
>  static void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)
>
> ---
> base-commit: afb39542bbf14acf910012eee2d4159add05d384
> change-id: 20250818-mt8173-fix-hdmi-issue-287cf353b077
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

