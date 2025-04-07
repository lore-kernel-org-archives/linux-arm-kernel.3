Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5173C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwrRsdM3aIoWT2MJF4GXjYqn1+Hiyvia31/nPwS1dl8=; b=U6zC6+8GoTfUWNppCPE1TgYkBT
	VTyezOVFAEqECT0WUks6Kylsklsn5DRfIGnqjUWXXd2ghTNHBBwQYNrDhdN625wvUKjazU1UrHo42
	hS5siyQvKkaVD3xVibLc2aVjAMR7rtR3iit2eIUIAkLIgBrmo18G8tzbM09FdfBNX6cDG+GchU9f/
	q5IlKAYmjYDAQT3qVt+uf0AMsFbPFyfmpZAfKDmwoDhtHQ44VnHFTXsE8CRsDUQmkAo2ohM1uQmCE
	7BxWlTz7+sY167tPMPPY2X6UnTfWzJ6hSC7El1NEl0XMhqfso0iC372hLWz0LlAMwh3ASX3FgQcac
	8ISVt5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iuF-0000000HDKF-2sOt;
	Mon, 07 Apr 2025 09:36:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1isT-0000000HD3m-2WkC;
	Mon, 07 Apr 2025 09:34:50 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso383834666b.3;
        Mon, 07 Apr 2025 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018488; x=1744623288; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwrRsdM3aIoWT2MJF4GXjYqn1+Hiyvia31/nPwS1dl8=;
        b=fFAL871p09EtmT0bAjNFkb/n+XithPCqXYNjHaJpJEz10uBt71nX5Af17hZGUZoqP4
         CsMCeVj/2ldJGqeKD32+jNUb0LI4ITwqg3k9S53nQ8szCepAldfmFrbFsq9D9QMUtm+/
         /vZAVwbKnxZOuuQGIBQ6F2JnantbWNJ91Zp70ONH452qeb1IbGE++gxUKMUbaQXC8Uxv
         VJT6yO5Kfw/qibHyc8kZuN5cV/jftMp7PLWGnYM6GTR8WomCLtpXnlEe55OluHnAgBB3
         sZoPC8H5H0JsC9x3xCGPvfEcnvp2TYIOVVApARgQ/2o4RFtAh8j6OXcyYOK9Pw4CRo4B
         y3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018488; x=1744623288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwrRsdM3aIoWT2MJF4GXjYqn1+Hiyvia31/nPwS1dl8=;
        b=GqYZpp7iYMDt6RaIDufBmoLuc7b9SpziTvSbaPVdG3R3UUmlRXS+2sSpTusAFSNvON
         ZI9wZriUaBIjbrB4BvgwbESs44oZnADN4WhnjIMVnrEnsQgOcyrUuqRwItNS6ylH8FEZ
         QPmI9aBn+I1FO4PzDNuO/hstEUqDgaxuEEKu9bCEJHBpbTALirBOy0ilM10uHo7PSFJX
         vFLdxXZmBSZCOdZpglrsogEPaxMN2lIlJNu3GHE8/ph0N0CfGBC/dWxVZf44W7vuZICt
         CLj8Gi8Bhn9JhS2ePSm/sl5orQgdMdXFhBnLwats++wpAlRUUf+SkUu4IqkEQ0Z0dBXK
         ZbqA==
X-Forwarded-Encrypted: i=1; AJvYcCUo4EnQuT9+LY1pVdLv3kJfqhRhe88D7ULU3WjBrFjw0p7Y1+UQjB29Uh0hTE5F3Ha36BrbhtgQazdaLb/mu6x3@lists.infradead.org, AJvYcCUtLZGgG8e3oxOwc6SS8HiXKsOgi0wgkoaPXkcZDPRVNz6MpuvHLTKplopnNhxFFAMjSdIZwFTYyiQt@lists.infradead.org
X-Gm-Message-State: AOJu0YwCmXSr7aMm00tOtsSGwcAr01EEvjxdjNQkSQLqfdiKVK4VCqg5
	xOm6Y5IGmpd1xcL8IN1vhz9KjV8/TxLVnRKwRE7q9wj1H5XdsDr7oG8BZxY2hG8nQ2T7gk1Wlfs
	Lu4BFrGBXPyDghc9NcVYkgCHqRCyz3Xsz
X-Gm-Gg: ASbGncv6xq8jMQ6fJZXLObwphSw45Lx9Aq2WLSNLrtlLGftRLTw4gaMbb5SsBv75ByV
	vX0syZVwWkvl71EVV8SL3Vqdfe7pVvYw1b09Y+eA9I4jLgUZeYEkXxzDsMrIxteVqMSZedS2X+y
	0faE3Sb0DpoXxr42cBRmKc4NpAtfGiK8W8vJw7
X-Google-Smtp-Source: AGHT+IHn/mX6ZYCompw3Is2f0TauL4C1VFhf8kSEN7pGoldfJnQSRw1eyX++36PYytRGjJUyVlLNUtNmngJ1zFbUZH8=
X-Received: by 2002:a17:907:7d8f:b0:ac3:f0a3:582e with SMTP id
 a640c23a62f3a-ac7d1c37ef1mr999770466b.41.1744018487455; Mon, 07 Apr 2025
 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com> <20250329190712.858349-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250329190712.858349-2-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Apr 2025 15:04:28 +0530
X-Gm-Features: ATxdqUG9MXYiG2H6XFiLtd2u9HtZkKwkET88kA5iXy2mhg8cVJJJUyOTBzVFkt4
Message-ID: <CANAwSgQHVmd1uaZpVmOJ1+ECwu1HQsKQwnCT2ysPBbi=16bbNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead
 of _SHIFT macros
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kishon@kernel.org, vkoul@kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_023449_639371_EB61DCEA 
X-CRM114-Status: UNSURE (   7.97  )
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

Hi Martin,

On Sun, 30 Mar 2025 at 00:47, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This simplifies the code by re-using the FIELD_PREP helper. No
> functional changes inteded.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

