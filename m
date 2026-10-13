Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6960ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=; b=qkNjYxwWI4epQbHTKM5oFSGddJ
	iNMyf1oNqAWIOPebHY7u8Tu/xL0pO8p9gbaKoImpWmzMKiZSpAhtAD93zqCT4A8XgnThva1oGSmRr
	m52FIlJuOTDmmyeyTvjcfZHXhEEnF8ZHezdobjLPL8ROlBrikNFNsb7u6xc4lEcTuX33DGhLkleYw
	ec25QCH51LRAv4Olulv+Y2VMpSmRzI2JVocSspd90OdmCBc9masyQjqH06AoMWitz6CTHPX7idaO1
	LPcabON45NFEaCUh3p+mohzn7iK3x+HsFTXsVIKc/5AOx+2IP+UzIZprMsbWHaFpTGqHaq/U4exuy
	BCMLaGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVrS-0000000C7v7-1Uaw;
	Tue, 13 Oct 2026 06:19:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVrM-0000000C7tb-3M8b
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 06:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=; b=Vl1Vgtfpj3pNBi6wdGwdJhYYst
	k0ulXIJY8+ayeAaxS/kvaJbW5BmNKXhsBIg50tK0W2McesEeeZRQpr7VGy694L7LzcGVZLIjylEJr
	asjaY0whzIEJgtWnn/pUAMcdlxoBu2p7KiRZCAunOjophXRk7r5wEEAcJ844GdOwLzMwmMqOVz6A8
	nGr3K/9Z84zPChP/dALrTXdi17eiwhASOzoXgAFg2qLnuCzVK/tjoO8khGAvMaNX+RvkXVmEMF01m
	27I/NprQl35c8fT7sGW5p6AosEHILmQpmJKC6J23WHrJ0C9ZVu9V5BqRZnYhsG3fICO9AIrzpQ4pL
	cUyZ3MuA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVrJ-0000000F9Zf-1ZVW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:19:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16392245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791872372; x=1792477172; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=;
        b=Ffi8uL6g7vuQUbB8DqBNnBG2USQtArn4VZ1VotZZg8ambTnHL6d5ewC08Q1kEzKPXa
         YD3wXv/ZJnPscwcaIJl6RFbGVfuOV3kt7o4oPGsx10enBpv1M3Ktgi46S3T6gyLlAZws
         q+4S+yv+PuwUpI6yBfWJliwMLpYT6enQgaAs7nRtXC1BddB/kEyboqelBIsVP1IexbO5
         N7IDIfCYyjSRe2EZzOos4HSEcwW93zek3gB99A+F/bYo3RkbXM7tNkyMyRtAY7/fcy+V
         mG/3wIauicAtsCB1+XAkoHtWWOUxwnfNK6zONQEICXsF1x2v2IzDolgSO8gj8WfdhJQP
         fdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872372; x=1792477172;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVZJr6BGUqZMkmvvywtMFv4Y+FRBCFB7MBPZsxpnpp8=;
        b=nS0kuGzMF8FcUbQu5Fyfcz8ktF6licO6nsVMy/6hyxEcIdDwa7yuBO0YFEMHC9V/RB
         Cd4Lqzrv+SiFhpuwXm4aXQYtWOo7/cz17VlxK4qRHL07MMaTNUVsE2HVHvaQ6nc7E0CJ
         QHebQoSdGpnnJEvwlr5VAUX1JnQjSPK05snabeW4fEe77sDrZUPSKGVLmLS3sJkjzZPy
         020uL20iceGALSK1Uj97Fer3HnnL6eaSpZav0l5kKwJGM2MnqSi4imaQk/LGRBrTuZID
         1Ixr8cZ3elyOimN3w2IfFG3VPJGYFITy3fSewTE7paiZqAkjtd2GxTdi4zpGPExeWUOr
         FiXw==
X-Forwarded-Encrypted: i=1; AKwUvBz/APZNb1taaspqZvNn6jWm+KnBeMU32KiwqPkyQ6wLrTMWyg1JlRFQxx0wpPpOYq+vaG4ebywOqFNlB1BGHDbO@lists.infradead.org
X-Gm-Message-State: AFq9FYIf4e518JayEJJcsM1usjqg9oo+NIYQ2GtzXRsT7oKxP335w+Vu
	rX6Y6VuZ3DDNz2YJulq8wbr/hSMmNkOUxMKTij9Hpn9sIerxqLRTqw93
X-Gm-Gg: AYBFou1mCw+IfcuDlks1M2xYCc0xPRoWO/F3onKdKTiFx6O4rPDJBsj+kgGxVL5y5rw
	F5uTQ3y+RnDsNReqxNzO5LMkYIkH0gSSJHAKnd7X2RB3XCps8K+2MKMDFtCQlfnnxrYopZyRCSS
	Sr5JDKIO1Igv3BJ4TjrguqFwGQqAVocNgwg30gGmmMrv3gIjR3Fd7BRPamlu5+B8Nc88eBSf7Ti
	TEMCB82ntbyGamrbVD24JwRJ+w+5/RfjUm1MSgfis2owilfurD2kCW52lbTxyhc/1ATH9uDflPk
	7R9cme48GltP+UXC4S8zwuuS6KUV8GOcZUvZUQN16u7R+pbFnOc5mxjnw916bcsYzeuWnIyBhgk
	nWhWJ6UwMRFgrsKMxbsR0qaKjLX4am0pADZY4rpDSN+piLxktuIeosu46y8It4mdq4TP7EYRvWR
	pTEfwNLCovy/axGA3XwbhKEX2T6W9uNjLy+OiLSvXANooGoT/m3qercLfKB3nEiX+Z9rwqg3eIy
	d6JyqHqdX+NO66OhxNxe+nNgzURwpmcTY1Q2VvTXIIWXkC+/ekhSYikmw==
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr250154825e9.17.1791872371668;
        Mon, 12 Oct 2026 23:19:31 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm264395905e9.3.2026.10.12.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:19:31 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Cortina Systems CS75xx: interrupt controller,
 GPIO, I2C and TWD watchdog
In-Reply-To: <ad388a91-404f-40cd-8153-3a0df3411c16@kernel.org>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <ad388a91-404f-40cd-8153-3a0df3411c16@kernel.org>
Date: Tue, 13 Oct 2026 09:19:25 +0300
Message-ID: <179187236532.3113955.136062642054162547@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071934_121144_D9E8C7AD 
X-CRM114-Status: UNSURE (   8.29  )
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

On 13/10/2026 08:18, Krzysztof Kozlowski wrote:
> Slow down. One small patchset per 24h. If you send some big work, then
> once per 48h.
>
> Implement previous review.

Sorry, understood. Your comments on v2 arrived after v3 had gone out;
they are done in my tree (I2C and GPIO as modules in multi_v7_defconfig)
and will be in v4, which I will not send before 48 hours have passed,
and the platform series likewise.

Thanks,
Fil


