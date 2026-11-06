Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A2B606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHa5tLk1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORwP2xj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=; b=OHa5tLk1Gesmeg
	bST9jD+qBDhc4FoQ5dRApWf3y3px3Mn6js1c8pc2lHNheolK1jSwtpoIXN/tNOGbLMyb6iEeE8nNd
	EiOWcC+TEn7jIZqlazjkasMQVa1PbSPMwzf/Z5S7xaQYcMaLl/VwqJBgXh7aS583xwpeFGPFr5T1e
	P3qy2h2bQuKns3+ruohVcrMnomRWci2rSjhkDnWeO0rHbppzGH1hKfujNz7tN97n/4O3ZFu3Vz8F1
	A2XDZio3R+XjG99xFIFFQfrJTdfH6j4Y4vHlZHAVES+ojJL9EqEOa+4U8Jm4Fn2kv3xzny1Rw/El+
	aeKle98ukkSTXDppPl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwzX-000000091Sy-0UqV;
	Thu, 05 Nov 2026 12:54:55 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwzV-000000091SZ-0nle
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:54:54 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-55e02e89f78so578306b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883291; cv=none;
        d=google.com; s=arc-20260327;
        b=nLypijV16sF4PNl6Ts6sypIkGFdWbs7w4HeZI530wZ+5MMv5bG/B1cqfh4Bu8ay67r
         WsjIuTvpxxAg9oHDmrYV1CW/JQrYruzL+SpjL2wKDWf+Y7032aIyq9UuavnWYWAmUJKk
         uKSl8CsTN/gJzU2XZd4MFJuPsQplscuNi2nPm9JQKhRdOCXvsD8zqFEOgZwV1/8EgwwM
         Uy1rsG8IGuSSWjT2ygy4JmAbig+5kK+HdBJ1WZDqnK1Cd8pOHG3lPhURyyPE0gj9+Ifh
         2F9jYecrrAW7lqIqHNCOo2SmalsF5DtXMqr/ssevK7+X7WXuE5CefMG99yxpMIXJILx2
         rAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        fh=ytTxLUnQUquGTJGr2hBV/jkmRaXAENkY/ni3VHO1yog=;
        b=AANoiwp2h2/Mc4JPEIU84mqMHGdeOxCutDtJHgAy0dUFJH2ZNh7CotTvXdtHlSwOpv
         V1HPS2VSOa4UkfTkIDzSPX53K3f/LhRX51/240YKwBhfCMwyq/KaK8S6873IBOSoFuU9
         1h/XDBGC1p2YvJgehGvOTUkAvRq8WK41erLoUHmwrh2l/ySWlSysJkWpNViC0NYZ4X8n
         +QO/uCOxFl+3zW0jAGt+4VDVzpdNTKixaxWAQJVINtND3rtEquQRDa0Ve+czbnbVPHOk
         IqJL+ZCEqGlBrTX3zYq+7mdWExML2qajWgbYlrxXZJ6aSG9wYAxKvTnaslTZtTXCgwWm
         T/Hw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883291; x=1794488091; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        b=ORwP2xj0yCx4zCdmabE8ig97psZXAFSKtMHl+AdQUAuv6obX2r0qweqSEb8yGsFLpT
         XVEP8yChWWbJjR8ZbaYzhpmAKd1OCgWYTjAXV3xNeI75qnsiroHM4KnyihQcKJPYx3mK
         Jv9aumKCHDjPrU4ZKetJolORKI5kGicr9N4kHwNV7CZsUz8LNovzSnDJiUp67DBIY33u
         lcZPbp0UXEOKMkJAfEOVLjx5kA0X71G63BmWRXZn2yH1Vc+dbhtWkSG4lyzSmoNXmTKh
         NSIxlyqgT5/mgqINtt9+0K+ACWRPgFo9HEzQJYhWE86UisPqGJist8nsKvyzUEd9v7p/
         jwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883291; x=1794488091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        b=Nk9fPKyhd8mDSEIMhGg5bpv0kdjc1z05IMRBc/spTQXY8NIRMBTS72AHWNxSm3ml6m
         2G01TUXO6pb7yIkUqg4zjEED8y+WsSnXrWrOfhJsSDhJpOjd/FcuxrRJzx36dKbR8xhH
         BDzJ1STlNqInqkpHnnntAYcmfswaQLOjAQhl4nXn66nCp4w0zRdQYuq/k5moO7gDxPBy
         XCvzJuAyswy4fmU97QGyIwpua8cdRzf7bTz2yjLCwzbrDBtFZSRla15BxfPaVQL/DN8V
         LO3FMkS3NqUnh+8C0z+GbSsHeoRtMnv557v2g61PKxjxHlyIWF+wj3B7/NF9djqJKPWs
         BPFA==
X-Forwarded-Encrypted: i=1; AKwUvBy0jXL3yDpdaNLtksQe+WPXxpcWJO9q2yNK+u6PU2mXlxsFsElfF2QHoNsM5ZwyM1VNBElD+32GDfVRIB3/faJV@lists.infradead.org
X-Gm-Message-State: APuU4Z+xBmpf/DChlNaKDfLtrwp896c6h0zxIrfKa3eBWOHwMXLILEWL
	qC26m2ZbPIqgsTUoIMJuOYfcnxFDk60gjQKV1laF1Iw54rk8yciktlrdR2/K+mVnHAFb3ocEcOc
	MthdyrWG3yeYxBdt7CMW5dwMuqXcEZIg=
X-Gm-Gg: AYBFou3stcOpJJX+0Vf3Mmde/3WMPqjFTMzgtMeOUtOCfa2irRHRV8gj+P0hhAzIMIp
	1tQkFEe+di3yHKQUqY17CnCsPvjo7uGvDWzap+KdJay8zMrwaP6QpezGwwoIYjCi/uw9xf/yHcw
	Q2aXe04BZ0nXf/nw1mJYlb8PqWXZJemjPn+oy2eJuFgt9YnqnrVkAF8vmQpu/FJSPMbNCtIHEme
	FrrI8jnAL37E0DMJxXpRJbtpUuC2g40flcYOYPoh+OBthcHopuKnIEQRaqEErFHO0GjkUyWhLRM
	7QemYK3MUElN/JJ1k0uxqHv7LSapsgZS5QjfFdgiggnKU6E9b0ZhxHvTo5vO8e1q7qddsDIS1OV
	btXxPf0I1+n1CTE+dUjpKR4W9nR+ElJpePgE7wPRQWCAdZUY90A4z2BSNtMJaQynw+6UHup1X+J
	4NbjBYEZX/CmcPYD0N39FT7ecdqSe+iM/LsekKSPbIf3w=
X-Received: by 2002:a05:6808:6508:b0:53e:3b0b:fc1f with SMTP id
 5614622812f47-5640dc2a803mr13971941b6e.22.1793883291559; Thu, 05 Nov 2026
 04:54:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016113846.8602-1-arash.golgol@gmail.com>
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 6 Nov 2026 16:24:27 +0330
X-Gm-Features: AclHuK_mK9V2l6M4jlS75n76fTlhzkP8UIpwt-w6idtrgAnrQy8Zvz7juL15y8o
Message-ID: <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_045453_257868_5B13F6CB 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: 1.1 (+)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Oct 16, 2026 at 3:08=E2=80=AFPM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> Hi,
>
> This series improves sun6i-csi capture and bridge.
>
> Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
> and height to 16 for NV12_16L16, as its 16x16 tiles require.
>
> Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
> same alignment.
>
> Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
> posted earlier and carries Paul's Reviewed-by.
> Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260527124=
552.33815-1-arash.golgol@gmail.com/
>
> Tested on LicheePi Zero Dock (Allwinner V3s) with:
>   ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
>
> As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
> this setup, so I did not test real streaming. I checked that
> v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
> --list-framesizes report the expected sizes for HM12 (16 aligned) and
> NV12 (2 aligned).
>
> Arash Golgol (3):
>   media: sun6i-csi: capture: Align size to 16 for NV12_16L16
>   media: sun6i-csi: capture: Add enum_framesizes support
>   media: sun6i-csi: bridge: Remove duplicate mbus format entries
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
>  2 files changed, 39 insertions(+), 18 deletions(-)
>
> --
> 2.34.1

Just following up on this series.
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D3216=
1

--=20
Regards,
Arash Golgol

