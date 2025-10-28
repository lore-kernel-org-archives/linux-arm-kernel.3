Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108C9CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=; b=LgHP6Z/LdhFTF5WkrPyO7zOZvJ
	ZhZWHAPvv9SMilu+Uy78fDwTtrCkaPaScTbSbV/+3MAj9IYWqLunzw3dWIp/UFHv0RNexDWyxHv8/
	2+ajMZk1Z51LxX0fIY/cRK857WOVRzqdT79oZJDJo0g7jY5dM6Cp/V9VXEhTUDDhbifKnaN7YtFW3
	gdVi6KLvrZNlTYZoVMB8nrXyY/YmkX1P73EH39/f10YKHvZJ0ZonyDJm1TFB7avOvV0pnMBtymvp5
	36bbRFwgHXEolK3Y/Ux/MeRRMzA2h/YrO9zC6anA3hh+EU8MY7Mc29ho6rOm7wBp43/0yQ1pmOrvE
	xz9n6OjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgP9-0000000Fh8e-0DVQ;
	Tue, 28 Oct 2025 09:54:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgP5-0000000Fh6h-34av
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:54:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47710acf715so11047325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761645250; x=1762250050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
        b=CFrzzo5UipMTmehr0EQVg6uCNo3XMoS0txE9lD5iSzEw8doWrkeUb9xmY+0qWZOXRO
         znihjQOpqUEX4GZ+9P3Hhz3lTN55+aRrE4iK1rMuYpqE/R+PL/MAB3ZYc6HAsh6hUG76
         WCnd2133ZNR7ofzDfyNyNd9msLrkI8Sc5XBPfD1kcxsMGmZTrvL5ykdVeePdUEq1lsqv
         lhEvKqGxaO7M/FkBL4jEPQTy89/0a4l9WZ06Cj7QHj8O47P7iH97q4G6lAuX7qTm8p8u
         wHYe03HNFbop+yZVasmBoyK+a4yMlxi6baB0YJ4xQ12gBwU5GkR8AIjSHMqpCzhi2H65
         y8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645250; x=1762250050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eov/MPh/YX8dO6loIW1fKNx4DJr3A70PfDx1JeMPyWU=;
        b=M+PLPo2p9qerA4MEpVBMQmvoGDILE2whKZ8wJEkzcQg1rGoU+C01sCQWdCkRWxt3GU
         aRjReda9LZ5MZ+TCZ5WlgLBpKOjHz5ZtgmoXDS+fKxK3Wb/0VALjKwNvnhmpREU+QZEH
         QP+RKtAl4Nr8Ij24Jd3CU27hTHaY64QXjIFzk9isL6H4kMVz1fJMfFhaDvXWYLqXJNnt
         CLiRnB1bKsLMZPncqkcj05X7vqvzVKKRaXpH0SQFYS3n8Ior47Zqh1fIZTc5M91yzgp1
         SPCgOpTL5sUMzYImOqKmH4xAkscM2C2hFist+7YDuL7l6s/nsUXL9r8g9W7tLuDwlfc9
         /sIw==
X-Forwarded-Encrypted: i=1; AJvYcCVw5QkruzNkA/TN4oGuRoa7DhegzeovUK762YDVvtkdA6l1FGBUyRFyGDPJ4nU1ItqNmfyWUBJjVrQxEWlMd8bM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/VB5/J7diE/Ba74Gf53VFMKH6ScsxNL8WlefK0P4lq67obEmx
	zWNThpe7SiaFgRBgBGfjON4ah76bP2W38p+u23GOX49ThsZwEIoOIt3m
X-Gm-Gg: ASbGncv39C1bkBwx5FzoAagoXd23ttKRQ3YKhvQKt5+01TQ0Dxydi9R29k0fJFbjqcw
	IbpVaTZDzZGnNKmtzVV7R35s9paJbsi1wxUDAws7JQejwFBm5a21cfO7kVgPZwI2fCeV0rjjWA+
	GjGj7xWOxZ+bJgu49xypFJHioRoep19g/vXdd6ILP8mfuZ5S0CS5UGmRelV6rywJHxUXWfZljVW
	asGAmBoj5cIdyjl+M074/isWGE6CZkahQSjh/TU4Tttv7bNQa9BwVkEZIvO5YU7Fi0VLZfhrG5H
	JzWGAgWBSI3OrZMhOzYvjSjZjiR/RV1s55K99ahxT21PSKTWwQqDwOSleq+GpJ1Bup4JyiU9nHG
	FzsZWaZgbizjYbHqPnqGj1dN+IbTbqqmjYghBk3bf0xuJwmDLgV4BB7qNygCbvZJmcl5qeSiG1N
	atbPF/GCSnM8cQuqeXANMb0PQ/IVKj5Krw46vM1l9xAg==
X-Google-Smtp-Source: AGHT+IHTsad+5R9VyJ1jsBgS805AF7/gtOcePpU3LeuhaXctgbpE0MIvJRpdSfBK4sVPhc9XIgYUZg==
X-Received: by 2002:a05:600c:1e0f:b0:475:dbb5:2397 with SMTP id 5b1f17b1804b1-47717d488f1mr20861355e9.0.1761645249706;
        Tue, 28 Oct 2025 02:54:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4783b8sm187327045e9.15.2025.10.28.02.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:54:09 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:54:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
 edumazet@google.com, hpa@zytor.com, kuni1840@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mingo@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251028095407.2bb53f85@pumpkin>
In-Reply-To: <20251028053330.2391078-1-kuniyu@google.com>
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
	<20251028053330.2391078-1-kuniyu@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025411_783997_62C84EF4 
X-CRM114-Status: GOOD (  12.99  )
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

On Tue, 28 Oct 2025 05:32:13 +0000
Kuniyuki Iwashima <kuniyu@google.com> wrote:

....
> I rebased on 19ab0a22efbd and tested 4 versions on
> AMD EPYC 7B12 machine:

That is zen5 which I believe has much faster clac/stac than anything else.
(It might also have a faster lfence - not sure.)

Getting a 3% change for that diff also seems unlikely.
Even if you halved the execution time of that code the system would have
to be spending 6% of the time in that loop.
Even your original post only shows 1% in ep_try_send_events().

An 'interesting' test is to replicate the code you are optimising
to see how much slower it goes - you can't gain more than the slowdown.

What is more likely is that breathing on the code changes the cache
line layout and that causes a larger performance change.

A better test for epoll_put_event would be to create 1000 fd (pipes or events).
Then time calls epoll_wait() that return lots of events.

	David

