Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB86AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=; b=RFJY4UiNwko/tO32MN55nEVGQR
	4FQq+eHS3sDkA+zUppuEC1s0HaUokdZTdsnUK1vu3sVACpjhASKZrGb/DReqrAWKcnfeaI469KZee
	KAFMczrtZQsYdFOr022LBEPkRrEtnOp9RlPYViu75taGL1V7zdqIE/ZU6/8SR4VxSdnnrDZlzBdZJ
	JrDm8okLygl36HZZg/05DPRw0hLt5xuwp4nCMc5NOs74g4HCQfoYNEZcIirbHBhC20r1QQSGHtynl
	QOs3gC8Bailx6ANT9HNUoYpG6msIoSsbK8nHZGq38cFLhA8jgpqXS9kMR/APljSIW6hhSAasmriLz
	TtPw/Pwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBic-0000000Af8p-1eqC;
	Tue, 06 May 2025 06:23:54 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB2n-0000000AUjQ-0HjH;
	Tue, 06 May 2025 05:40:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-30549dacd53so4494666a91.1;
        Mon, 05 May 2025 22:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510040; x=1747114840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
        b=PGWFus7xxbnmjP7tqRUT5mQthkXkD3kIPJWqs7CAXj+DHTXVAvKVpHhaoNn/V93Mp+
         fBx9VKQRi0Md3Zjmsdd/kzxtspbTtHGxnAD9XUMvu/iHUqsYbu+w8q9cjD3CUZwjdPjw
         vop5AOm5X7Za2lcXBUwltRrdFOBSekCb2JfGQCGLJCJNN4xbEVBqzey6dLz43pqKyk81
         JV5pyRzqAILl83xnNq0NmA17buzlpOFsbl7eMEa3bCwCtaPLqHYRXb4npnxuuJCXikAH
         N3EHZ4uujTycry/n87ML/fgqvSOTW4vyETylk3nlWXUGDdZ7N1LfqZ5jZjqyZ/Y6r7GT
         v9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510040; x=1747114840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
        b=GYDJkMPUKdoSggcB0Q+5cyNGmm5DTAgICZ2C3DrURuNlMRzw0wsOujUIE3SVzGenLD
         8+qEFmNjE/CB/Mem/Uk4LxTszGKjpZLuRxqoF0qGSaEKgcrlHZrcm4z8aCws6V5HRM9f
         NXYLPK8w/gOZif6lgQ6fFeIwgH7C80X5sJElgcgtwzaZ6CCMivYFJ8YUaHW0+UmE0fi6
         FaJeEiyKm5kLm5OgAfQbj8PHaxkTwPrZ3/gwSieISIDrKB+jHV4cetF6JfPn8WRoGDhI
         BNSbCfbSCTkoN4fpwJpQg5xeTId7EjUJai1PYX+JyEINqdDsGCZw/oHXiclbFeMBtZbv
         BeRw==
X-Forwarded-Encrypted: i=1; AJvYcCX7h4DXdD6JeSp+6gGzb5wix7tKJt95q9jWx3bJVb/YIA05ohNz5rjt0DHiGVeVAX3EJGQ+jdBSPW8GGdWDgm6+7w==@lists.infradead.org, AJvYcCXC0U+mn0UF9IH6bClsKUNHzDfmyqNSESA1sFvVfoQ3dkVmngvagqHFx7WXy/9ZLnQ/DC0PUXeBlR+Ku9tK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw74XmzZ+37RD9jtwhqTpr2F1XJBv8iIWl8hQlNZWSFKtdWyIAG
	zpNElWO6gGZiBrGXgVTRsz9s+Ddq5yxvxeu0IG/qqhOwaGx+fr/CliY2vkmzb7npT9Ca8yDs3t1
	wTmMDxju/PEVGUreV/Dl7wTVkgs8=
X-Gm-Gg: ASbGnctX8cedA64+OjOHzOIc+8b4Wf07GaGt/K/cRor7Nww6gijXBHo3Q1acZSewTjS
	y6iAzwmPzZZKD8pFNz40Xqy+4KqgYrlBgBMMK+h4S6NUHdFu3oMdW/d0mTgJ1GX2oY81THFUEYJ
	OZpVNQMUbz/04qw8dXnrS5jT3fsKhhwdSesMuTvXrAeY2Hodg=
X-Google-Smtp-Source: AGHT+IGH2VPUNqhKP0n7asYw5iLX2WnGWqBav+nif7/SVHvaSVRrallgXVrGMUXr17M5pJMS8YFYExxZQjpe5eZ+A3c=
X-Received: by 2002:a17:90b:380f:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-30a7bad3792mr2973119a91.4.1746510039781; Mon, 05 May 2025
 22:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com>
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:40:28 +0200
X-Gm-Features: ATxdqUEfi7YvCZqVRTEcgT4RIKU17ch-N4bMmEbxaRpKJa39QnO_szEOKK7kln8
Message-ID: <CAFBinCD2wHRfP+1i+pUwG0FVNr0t6uHPxH5uetbJN=RcQC_A8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224041_122918_B7505F75 
X-CRM114-Status: UNSURE (   8.14  )
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

On Mon, May 5, 2025 at 8:43=E2=80=AFPM I Hsin Cheng <richard120310@gmail.co=
m> wrote:
>
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
>
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selected=
Issue=3D1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Thank you and best regards,
Martin

