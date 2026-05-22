Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9682CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=; b=LmQ9WXEd2D31wKqWpaV+4RVSYc
	iWKed2li6Wi7xPz99bo1xArtDNW1LvX5L+4GomQhroIuPG8dmpz30QaGwRFvrJCl+1uEx2zWaPceQ
	ECJ11DhTq9NNACpCYDfxYm/tr22Ya3mGBbYvC4Tb+nna2HfPFi4cMwgZ/8/EOCK8eM6lL/J6vr0/5
	7Klrk1y0dZjgfRD5iD/oYndVxzvwV06g2X6MOrJ9sZTCcCcIm96fNtFmPuRieGT08rbLwR5d9Bcde
	/+ZNi/7eEfZQObyZHm8KwkNRcJPxF0hmn0DOMJ7cKHQozBLYMj63kCnC/lQdGz+OoCZpWhnk4CePx
	nXA0Uamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPzt-0000000Az7g-0x1Z;
	Fri, 22 May 2026 13:33:05 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPzr-0000000Az7C-0qBL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:33:04 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57512b86273so5327840e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456782; x=1780061582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=RwkI83iyHcn6KhdS/BY8JfapDfkUU79Y3WyxuD2v6Tde5wtKtoriR5ywxRUARRGHza
         jABTY/zbzHkGJIrxxvWsrpGgGDFl7sP3e8zmQTS8c3RF9ucvVzMGfXMjU/OYHHxrHcq4
         cepDuqmwBLtiLJgp8TLnhE+Xyp4dXX1LDJKRZAq6S24pm22aoHlJEj2E8sjJwovOPw1w
         1KYSWn9IRRXIRj3IULtTVqy0iy2zYaEWzYYSWTSPcf1cRSI5zSjOLDozSXCDLreHSTIC
         VDeiBHTI6CrBv6c/II0uTy4BVlW3OHdgqCbAkQeD1a4ZrBqAYJf52R+kLxMf8kthRg1J
         MBjw==
X-Gm-Message-State: AOJu0YxvEpDtX6NIk4qe8OXOPAoLFDKxxbRM9DTVTGFkLgicH45lUIWi
	/ZQ7XRqV3PlOW//GH+PfGPdFX0+ocm6j21rPtqtRmtjuha0XYWRDVFGaRmXhhjEVsTs=
X-Gm-Gg: Acq92OFkKe+qNu7Chw7GkmjMv4zRZE+0ipVlwzfDZu7uES2FbB80NOqxpWyZFEBh3jF
	r0AjIPK7++hR/nO62xXA/qtHYqhTiE0ktW/6OA9stY9WnSlGke/UPuUrzuAnxEFbxENeJ+uovX3
	qJgxKVtRY1G7iDG5T1JZ6WQNc9LW9iqZp3C2RV8GEhCdmDq5Qbp7ZFzPazIVtyKUTbxkkeoBSBs
	hgbsOZRXee6NCfz6QDFyf7P0+XaVpCs8lEUJXWinfc9NnjF78v16GPEY6OnMzSsd5rsSaesqNgd
	W7J4f9fOzCIeXy7cZDsDV/KvcBbZK08TGBNa+5pPf6UKCNIuEWZowFm/CVVLr+iET/r9Tng9wxt
	oZVP44u5Equq8JZinaqsIEBQ+N7Z2ucKM/VrSwEmsAbDvhyhF60JA4QvlQmUaL0A2+v33AVM4K5
	ZOifDC3LEUkYYE4G/RkQY7UMqKmF9GLTN9eOXHfHejqR6EFaK8Zsk6Op3vIlaHTL+1ktPSs79kg
	Cc=
X-Received: by 2002:a05:6122:4d10:b0:572:353f:be2d with SMTP id 71dfb90a1353d-58663a5c46amr1875525e0c.13.1779456781447;
        Fri, 22 May 2026 06:33:01 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791fa49sm2158526e0c.12.2026.05.22.06.32.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:00 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so4952710e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:32:59 -0700 (PDT)
X-Received: by 2002:a05:6122:d07:b0:56d:8ded:796c with SMTP id
 71dfb90a1353d-5865f81d405mr1996416e0c.4.1779456779687; Fri, 22 May 2026
 06:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW29ihBqL4S6bzDVw5dAwYWXKSki9Nz=BY51i8NP5D=VQ@mail.gmail.com>
X-Gm-Features: AVHnY4LeG55-0Nh30AeZGnk8727WjXH176FAkQkG1GYU6MDB6SKJVQ3CS8IechE
Message-ID: <CAMuHMdW29ihBqL4S6bzDVw5dAwYWXKSki9Nz=BY51i8NP5D=VQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063303_244158_C4FAD090 
X-CRM114-Status: GOOD (  16.90  )
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

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

