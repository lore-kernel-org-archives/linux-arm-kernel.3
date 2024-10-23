Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7FECFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ovYWQjSscguidicVSZDApcP9vThLQFuZ25Zqnn2i2k=; b=GeGZjvkDYyBoRX4uhZ+liukEYb
	jUcBrQKhuAQNbrlklUMNTKToszWVLKe0omTq1pupXbx+CmCH4/XCf6of9E49ThXG38S+fNYJQwv1x
	aYDMn6X2812/HAUEsb7bxCKWwgm22b/trOFqyAiezremGS2MvPIUcayDlWQFU2Q6JJKPbBXvYlWA9
	eLFCfLbQy3RFMDA2f5W6e8Bk6Ef4yTT7/MY33fZMTrgxUZ4ALBmkmOjKyhNJVg110aSmK1aOJC7Kc
	kOnENU2lMkxENNgQjz61DqhEVK0tVMUDt1kOfkhL2A9Z4hYPVYgCJjrWEQSqi10X5gGAhWq6HSEud
	kQqcSL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gw7-0000000FesA-2tJp;
	Wed, 23 Oct 2024 19:22:27 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fGx-0000000FOEN-14hS;
	Wed, 23 Oct 2024 17:35:52 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-83ab9445254so176239f.0;
        Wed, 23 Oct 2024 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729704949; x=1730309749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ovYWQjSscguidicVSZDApcP9vThLQFuZ25Zqnn2i2k=;
        b=mkUcLud5c0Pb3Fsb4LStOPOgaogGK+O9iUvHo5f1yfAJqGUt5GIbZS+KC+KQtNG82i
         EBQhZIGESOjdO2PvA5v5MnqRmHM7dFY1Xo1jTeTSvOxm7U6K33ZPrhHFP9kqrzet1lZ5
         WKtAbbDIFILTlDq1Hvapvn06LdIOnYNOn7lohEzjAvOwfYigc6CxeT4EWeE3245FItzM
         bZKEUIQYLMiCH14v0UDJtf9L8/fLbrQepHE4s4A9KimidkJ4K/swlhvP2iMAlkrY717x
         u4MYSUowi0J0OtS1rZ0CIzJKOO+ht/jmQXSW/1dQShxJKR2vcTz8/R4oI49b5H/tNuUf
         2ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704949; x=1730309749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ovYWQjSscguidicVSZDApcP9vThLQFuZ25Zqnn2i2k=;
        b=no/J3ydjtEE081oKO/25zzDdLscB7wCD8Tnai2nHkGHcMXSOtMQS/Gp5Ts//QD4hgI
         uKJJ88lmK+aJEnozkL+swAIdDC6M4ApcND0lo1Gc69VvYJMiO0MTRzTzLXp/3bGI5Kkn
         perRl/pMcj9YrO8oNkUkehmJR0EbWMfIDyCZok/foiarRuLeONuCvQGZRxQqAEISRbtj
         UkxG3dngXUIbdMhCKjYR8NLr0YuhMQcwwb7TBZxECfHn5SrwzOWD5KISBDtdek0EvsTl
         kgc7KRYkQn+oUnI+AAf1NIaZoTjwV3FtbYW/JGBICuEFDU1fCpy1D+qfzuEy86wQ4OqT
         VNqg==
X-Forwarded-Encrypted: i=1; AJvYcCUJhe6bJTOcZiBX1c2EOk0hRKMUM6pUnnFH5+IzA3woYmnFN2SfVlmbFH10an2jEVRr4VUJl71DNvJhqJ3j+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1OGv29BBxYO7Cx/RtNM7kxmlZBh7nXzzxibASknBndIUg0NZl
	f7izJSqNWyJ9uOXkebZtcDiBN3JmW1qCimC6lVemxIXWbPJozWEWyxe0ZA==
X-Google-Smtp-Source: AGHT+IFNcfiRI5mXvySi+X2Q1V2GhkJCnsfc97v6IoePj6n99bdtlwZMFJ+F/+hJRzyQeQU4ZrmN5Q==
X-Received: by 2002:a05:6e02:1aac:b0:3a3:9792:e9e8 with SMTP id e9e14a558f8ab-3a4d592c8famr36322185ab.5.1729704949159;
        Wed, 23 Oct 2024 10:35:49 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net. [174.20.195.90])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4db304c0asm2501945ab.78.2024.10.23.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:35:48 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: dsimic@manjaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	shimrrashai@gmail.com
Subject: Re: Re: Thinking about firmware and hardware description for latest Rockchip platforms
Date: Wed, 23 Oct 2024 12:35:14 -0500
Message-ID: <20241023173514.4538-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b12103b968cd5817f25deb7277d6054a@manjaro.org>
References: <b12103b968cd5817f25deb7277d6054a@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_103551_378604_58A28324 
X-CRM114-Status: GOOD (  20.68  )
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

On 2024-10-23  2:46, Dragan Simic wrote:
> As you noted already, the DT definitions are fixed and improved
> all the time, which is actually great.  However, the backward
> compatibility is ensured, because newer kernels are guaranteed
> to work with older DTs, which doesn't mean that the board DTs
> provided through firmware should become frozen in any way, as
> explained further below.

Thanks - my concern was about backward compatibility so that if some
user did not upgrade their FW but then tried to install a *newer*
Linux found things mysteriously breaking due to that some DT revision
in code had broken the backwards compatibility. Of course that could
also be considered a bug, even while new FWs could/would still be
rolled out.

> Freezing anything would be simply wrong.  It might look good from
> the perspective of having something "stable", which is similar to
> how x86_64 firmware works on PC motheboards, but the continual
> bugfixes and improvements are actually extremely good, because
> they prevent various ARM boards from effectively becoming abandoned,
> which is unfortunately rather usual with x86_64 motherboards that
> become so "stable" that some nasty firmware bugs are never fixed
> and their users are left high and dry.

Yes, I'm not against new FW upgrades, just the idea of users *having*
to upgrade their FW simply because a new kernel came out when nothing
like that is typical on x86 or at least in my experience using it over
many years).

Note that the situation of a DT upgrade that is obtained by FW
upgrade breaking older kernels, i.e. broken *forward* compatibility of
the older kernel with later DT, isn't so much a problem because we can
simply keep the older DT in the FW when issuing the FW upgrade, as I
believe there is a facility for supporting multiple, versioned DTs in
that UEFI package [and if not, it could easily be added]. It's the
backward compatibility that is my issue because reflashing FW, even
though not too hard on these boards, is perhaps more heady for your
average PC or smartphone user.

That is to say, I'm imagining the case of bundled computers
pre-shipped with the loaded FW and OS installed as usual and someone
says "hey they got a new Ubuntu [or whatever], let's install it!" BAM,
devices stop working because they did not upgrade FW, forcing an FW
upgrade in a way an x86 user would not be similarly forced. Though of
course, that could then be reasonably called a regression bug (as it
would appear from the user's perspective, not knowing about the FW
change), if backwards compatibility is indeed already a long-standing
policy (and is really what I was after with that "freeze" suggestion
even if it itself would not be the way to get it).

 - Shimrra Shai

