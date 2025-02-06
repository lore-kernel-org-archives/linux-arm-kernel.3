Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5998C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=; b=E8SQPP3ytt7P8A33EeHGz3q8+C
	6s5R8LdWAuJsHpc5ntwzerMA+8QlMs9ijgdl1/ziWfiVm068LWYOMoOY07+S4PJbDKlORO+MC7J+P
	opMIeSu/+24BUtI0qJolGTtb2ocuR81DiOIXQu3pa3QA31lcXD2m34M+dNvUEM2k2R+XL/luMeZMb
	fWDeS0mNnrdy7xiBBagW4VBGhCZNUQZWDhPFyKRcITxeFR4MDbO+NAc2I0xFlPIF1qtRc0F6bg+xJ
	fF+tcq4DV1F/qfyGJ5xFON58iYTwc8X/VaQgqd/4G3M84mIMFmimVkE4X40fJpLI6bRzMXJHLqpLQ
	huu8JTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyBG-00000005pnD-15Nu;
	Thu, 06 Feb 2025 09:28:18 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy7z-00000005pGR-2vcC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:24:56 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e58a7e02514so587988276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 01:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738833894; x=1739438694; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
        b=j/BZdWflMUYmoqv5uJA7WW/ZCW5/ErCoKgWWSSNOSDQggH5VOuSo6o8ebgmTnvQGvR
         ZnIsfOu3fRFUyQVp1TRPFaU3ysU3tjoQLyt+U/aJChCDYIbrwM1GiujT7AzuGNr5VcuY
         yAJqSpbN4QaPmV1gwYKvl/Jd1K7Hm++KOHLs8kZ9dGHZ22HyK9H8W+oTzP8s/xaa/sbR
         CsCsrjScJjwWD9c7T7C7Ok2uRAGnZpcNzCLL4OvWzC6SzrExcHIHOulEPHYrO2MfujqP
         3mTIiI3FOFz7tK2G6ZPLdECvKtCDP6XJ6r73B6KRquuRnm2kLE7qqIoiinNq9PYZj+RQ
         MLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833894; x=1739438694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0Aj8VkeJ1ljtNruUSkipfngsktgaMJyC1xm5s9bvks=;
        b=KQXZWkQk10mO+DR+xInF6dBcwQWwzyG7w2qVUrfNnH8ooGHcYA7s8wE+IpLulNeguK
         XFJx3kvX4bQaosE6sARrdy3C5osuuPeBQ454KqjjJDB8Txg17sEnAWo6WhIFQchBeRbu
         ovWEPMlglz5SAZov+mGA0hgEEuyZMAgKOCzh7Y9pZ6s4n/X8wd5jodCV/Cedf9//kAfd
         +gDb9N8cYRFv0dxxOsvDx2riWLOjezCUGyFTtAT+AsQM/Zopkzpqo68V4MPU4MtT4jO8
         3obhR1jKCdfuc7f6cAO4kmR5XCezUHivcmo61OY6ZtJz9lguh/iyABtp+0dCTouByC3C
         bFFA==
X-Forwarded-Encrypted: i=1; AJvYcCXSK2sXvwfAXEDi6OCUNwlcoVhyEOk4B/nzGEHaeQicslWABCq4hOyn0w2Nm1LanTGvc1KPB8Vp/DNt8VYgK/I2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4UOyq4hKmlEyGMebIKv7yzAS5EId2x5p+PScUgl+8SrbNbdZQ
	WS9CEwjyQY7u6ynw3+EcwFil20BQriG349sUo54w6OenpLBOIeO0Q/aOsQlJDXnDNELE/FjD0Ft
	5TiC57chj5nP4P56hc0XvZTmdfWw=
X-Gm-Gg: ASbGncvGqw1XI5aGXP1srL1v3aK8G+OXoOTBfqPT4MwrvRzktu7jbZoayu0QEewHTyZ
	JcepYdu9vBY/SDzybyjvFSn5aKHcOvAO/mmEFXJxJc26W/8hNUkAhwVhnBOU6pIUe5my4zTNsxQ
	==
X-Google-Smtp-Source: AGHT+IFbC6DM3fJVG17MrSGBXdIfeROMfW7VK5TSEM0p/SsdBlf6NEx0KbnND2bApOZ90AM+CmqzpnxiCUvcGg1/hdc=
X-Received: by 2002:a05:6902:2843:b0:e5a:e604:78df with SMTP id
 3f1490d57ef6-e5b25b95544mr4817982276.17.1738833894216; Thu, 06 Feb 2025
 01:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com> <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
 <20250206-caped-premium-squid-595ecd@houat>
In-Reply-To: <20250206-caped-premium-squid-595ecd@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Feb 2025 10:24:43 +0100
X-Gm-Features: AWEUYZn9JAn4vxk91DxbpJulbYrsp1RnWuViBY7aesXFIweT5vWahzqXS6ccsNo
Message-ID: <CAMT+MTQBSuWCz0T13RkhyJLwV7tuk4_BmVH6vACFOYx=msc09Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_012455_735623_D20E893D 
X-CRM114-Status: UNSURE (   9.49  )
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

On Thu, 6 Feb 2025 at 10:17, Maxime Ripard <mripard@kernel.org> wrote:
> Sorry to figure it out that late, but how do you plan on maintaining it?
> Where will the patches go through, and who will you send PR to?

Downstream development is done via the https://github.com/AsahiLinux/linux/
repo, then send patches to ml. Not sure if i want to send PR personally,
it will probably go via one of the drm trees or via asahi-soc.

