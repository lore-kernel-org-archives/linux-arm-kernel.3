Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830CCC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=; b=T9m2A1FYM4bat4uKqaY9tXcOkV
	gjtaFOkR/7/fsbbGoctlrI0GBnh2aJgNjd/fZ+sTKDUPYFxRF/+A77nQQY9bSdh0hM6eKqHHpenz3
	31N4YJIuBe45lE6cSsvRGRoM3r2OFMSdmdDlnFtZ9QHgeIUqZ49ODKGkTAQMW4rn7J2nqhuUU7G1h
	TrcMeBATi4hUfdekj9g4US73H9RBSbLMNlA9TBf/U7aRhnhE9U+et7acyspLGs0DxPSla8vc7Q634
	fe1wY/vjGc07eo67V2OTVr2UOvK9TlxesMENMbarfeajt0tuMs5JY7SbvTW3YcKNBa8CZF5Y+M54I
	NUFkVtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4D-00000005inw-1mov;
	Tue, 15 Sep 2026 09:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P48-00000005ij4-33On
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=; b=VVEI/iMmE/kzcXWeTfG6Yybd7i
	hIFt5i+i+KjT+rd368XeIP6/Bd2/uSNwAXxzeeRVCRfaUMs4kuGw9IUno8u1IHAFUgfbNcUdvJHvt
	mWVxoK9GqI9alQFtfW1jzlK1sT6lIBC6aQckFVOVyLgEhVJHZP8WbTpiNcS2LVGzWfd7QkGYr+htO
	o5A/04c3ztHOJOlVfxP36f5LjKy6LOHn+gVEPACZm6ykNQ7vnYgk1NB9N5XTGAnhCT9WQRNU2isCK
	A/IV5Y1WyKN4qmxdT0Ow77KfcVdZ166u7kvzAPalxBq5WNzcvEhEIstYuDklbcnkEzdQBjfX4WjxB
	CpdgF2HA==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P44-00000006TDu-3iJk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:02:58 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa65080so7054566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462975; x=1790067775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=VgjJbtid77mNy6RbJe500yzJkj8KlBJTociDeuQFhIiSbp4MnBqGVuDctOzutL/D1D
         gsRnDH3O3YziEIMC+kwfHCg5W8HWzWvaa4d9jWjjmuzHXndEXWQ+CsosF0HvCUT3Px0T
         AFt0kfz3/3b5octlRQu5Ygt0fjWaAm7FcXdz/B15AZ+ZL8iyjW/DUJeOpGPoRWjBN7YO
         77IEQc0KwqLK4k5rGPjtyzUBtwRERQU9tdJTDvmRzv95spU/Puk/DL8wmmcbqqqZ+z5E
         2qKEcjPEZesZlwHTMq2s6hlezgJ/rdpmWHOHJBgoce/62HUiJ8XczjlucjyennS/0JdS
         oRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462975; x=1790067775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=VC5uB6YHw5m0Gp8OuQu0ryelm/frxEOURBQgcqz/MFKNUHZjjmHKd3eShgVtmIlxLX
         JlSLjUuUqyOv0k0FtP9jhFOb9bXqIiIXAePKNp1iiKXpmcLiuveH7XZRyH/p0+tUCVpY
         TuMitzcKl0Djq8N9+sgXHpfsMvDH0r823UPXT4UwW/aAgRdElQYy+kby06gANO9eqZLG
         swfwGw2kIOcnb2V5SLf4KcaXcxlIxZ1ymVZakFd2+IKkH/EdZz2jvxExkExeTm/gxVAA
         jFaa8jmJgE/7O165f0nUitt5wiLGrQlmh9ekKXCKZ/puHaFoMXbB8QrF2YE6xR0NJA6P
         GJSw==
X-Forwarded-Encrypted: i=1; AKwUvBwLAtDhIC0r1I9f0/RUfDRqXw4g2SAwjqa32WIKWpWjUQTF0trxbKTjIDAwan+1I4prrSiJzohhzupyRAflLtz5@lists.infradead.org
X-Gm-Message-State: AFuF++nPLolbGxsLQirvx8rphtqCKx+sZAncdaqpP2T3/aK6GbBLwjlY
	XDj3ra5fRWY3N75BrNmZT5GFUnGfVuo9EaU+GuHzU1ijVzBMXOt+Jh21
X-Gm-Gg: AYBFou1y8jIATxoDER2tHWpN1UpVwa7ErkMEFyMswqbqt4lXcHTlm1KERG1TckL7K2y
	UdwQK94oGYoc7EC5d3sFSRX0vusZysH+armw6fDT3enhAD5d0WvjYLhgYSOOGeAkjHGLxFOYU7P
	m92+9sTgDRdgN4RXvhOwP2pGQcAeJzsukUmOiVNeegALRRmb119cC88QtmNqZqE7DU2w07wftKg
	ui5OQrBepYITdWtry7gbGuZ1Bs0XxrW9wuGC4I6tg01l3CG8srzFg0uZBpNq6rH3iTvASLmypS/
	O9qZ7mZ1hM56ThVIJCi9wLBMyhmOtzydns/GilXUm3wMvMkf1rAdNO66C7ehCtVvrxWDg0uYcj6
	5nYGvke/201B1nJpyaEbG/o+dwNyoxgwCYyAEZN3PSK66hSFrdjPWZRY87n65eTFoR6V3XmIOmK
	8aHCohIp7likZh8qhIUNbWhhw1IWTz5KDGrzGYSpISH5H3paM4DUThGI6wpxBchobHJkDHdyXDf
	7zo8y6UP60nkK3APAfPiwu90N+38AEidD3EfFPs7TuJBcnTROSqdzJqaVXTKVT4Fd/IR2IwFVdR
	0EwY+1JAnKQ1jXBA6x8E+syguYOIZVG3Oz+M7Bgz+Wk6bbP+zNqSfffXLus6tvVtlmNZTMkifd6
	FvxfGSIIzAERc6e9a/RJ+RMKFF1L8uN3bkIMokzEGTmUapCU9if2iVQGYESwO0ulreC3OKHlDMg
	jq7Q2gIqzlyxDVFO6zabkAtvWlGFXsWiNhsYLj7iM6lF0YYe47eYmFL9cp+Nu7hJAr0WvRVKLHH
	v5dwLAIZtc=
X-Received: by 2002:a17:907:948c:b0:c29:49fd:c98 with SMTP id a640c23a62f3a-c29d7926fbfmr13664366b.32.1789462974448;
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/6] usb: core: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:18 +0000
Message-ID: <20260915090223.1346-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100257_290365_812592A8 
X-CRM114-Status: UNSURE (   9.98  )
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

The fail label in usb_new_device() disables pm_runtime on failure, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..dec6d5c49759 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
 fail:
 	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
 	pm_runtime_disable(&udev->dev);
+	pm_runtime_dont_use_autosuspend(&udev->dev);
 	pm_runtime_set_suspended(&udev->dev);
 	return err;
 }
-- 
2.47.3


