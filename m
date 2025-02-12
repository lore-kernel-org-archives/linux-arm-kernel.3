Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960BDC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+ede4RrUjYL6rNcNJR8w+SRtlFFhYFYyooGZI9RRMA=; b=v1YVBA2rrIgGKKD9DDg+gV7j+d
	wBey4myp0qTduBcLCqnYHh/KbUiOrM5xqn6Y54Am9hnClv2sEocE8mXggvOL0b+zxJdeWzARmLwLo
	f/JeUPRbdxciD9YWplQ2S7IZRQmlyOH62GMooULjj3uhhWWFuM+pa6F+4ringfzoIWm9lMYHsVDFs
	1YHUuckUZWTT0ILjkh4/FhO2VqMRTkHWM7+DW1JGdUaq9YMvJ0YzQhBedG2gVpZ9snXy94By2jdC2
	Jbbmx30eiveVkgEyuYCZ2x//6ieh83vWSvdKf5n+z+9luGybp10OROJiPPHs/K1HrLY5FDdaGNvPR
	31BRCnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDIL-00000007aS2-0B59;
	Wed, 12 Feb 2025 14:00:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDGt-00000007aBf-1un8;
	Wed, 12 Feb 2025 13:59:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dd935a267so3121453f8f.1;
        Wed, 12 Feb 2025 05:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739368761; x=1739973561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+ede4RrUjYL6rNcNJR8w+SRtlFFhYFYyooGZI9RRMA=;
        b=jSewpRjYGr7LGterWu21Y8jutIfOdmmQ83yDF+qn1EAp+xRAMUbo2xYBy9wLDPQFad
         2h6BUKF2Wv0IutPp4ch4T8UzU+fMVrPzFTme5uQpMv5gUYOAyS/m9DV6F+Yxkm3bUbn/
         2ktq+QpxJp4dmf6SApHParhj5tIrmE/5Kxyp7xeybjxw/LIKVS65cI5umQKIZIVA4FCn
         n4uJfNC/u8mkC87p7l6PfKeXP8ylFxN2mDmLKuVrtjQ92WQaFEwl7YWbV8KET+HLqb8q
         iLgWxnlCG5f5KJDkKjTJ9qc4n89Y8A6hjBKfJl5TNmYxArwMyiiMJJQ9qEVvi42Rxtzt
         KgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368761; x=1739973561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+ede4RrUjYL6rNcNJR8w+SRtlFFhYFYyooGZI9RRMA=;
        b=GBj84jd4it8wb1PAOszKAqZQtT5P6h5S+uyYM2aZweWybKx6mpbDA7n4XukG85dJZx
         ROis5phwTSdC/IruIKb4twz1tIcLwe+sZ9IS0W6BRod78GwWWGlzPI0STGGV5IJ365vO
         kdMzOXJCL8GTHylflciGEgV5CRGgmF1jFLZvmGBe/LuQK5z7rxWh9lWJ5y+DKUYoikao
         YmV6JA7W/l/QfTPv0r6osfWatC2f3GlsSmsbiFmhFWPhpwFFG2rIsuH00Ggvx29n4ltk
         +lSUhwP7MXu3qURkh46XV4XcTkxRo47SQAnYDekWtspZsYQy9iVgkGv9fGNkil9CXcdi
         CxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcy3UdvOz9s9M0h0urJxLcRBqsPKucceQut5ztybfwJxjQi8We+7Ez7Wnr5B6j3NHJYv2kM6+BYIgenGs=@lists.infradead.org, AJvYcCXgfHxYc9LkeJUY02+003XO1gCcBJkWQ+RFyh7D8f6iJ8Cg+NKrSM5xZD8WsWdgwUIXIaMNoXvKVkdSukf68ZNE@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIp25FHspvlutx0lYn6ubWTxHF8e3GtIviCOdhyUDEOTfBL3j
	5AeAqgrV6LSjtUdDKzqpsxC2dA07bHUmZGn5cNiJ2S8uvdEHUj+k
X-Gm-Gg: ASbGncuD/yr98MlBmCvyl7GbkPknWSqjqOGh16gz1B5r1N4vheMH3qpwhH5Oft4QqIG
	B/QphHlEochbqXCDm0/9koOeS0lU4ks3HAFhcT5Ecf0EbAdFLLPdw52RbspoNzR/H5KxPml+iJ7
	hrSCVpX1TgiAtwFTEYVVSCRCFU6/FVSXe/5RfyTV0Evl1A95Doq/7lq4WljzjLl2iyPeSdYJESJ
	pxUxb3XowWAGZlsdVaAsPOSDXdSrHuZZFZlB6aV1XUpixB9FT0evW91I+fkVcVqNUq8Zu7hKpD3
	uXsTsa1wdg155TSzEA+KIWFX9RwjSIrKdSteKFcPY/bvMA1x5JGgBg==
X-Google-Smtp-Source: AGHT+IEKCoDJGY1lmlxzGAZbmqw2zwD51cxjE08/BzvCDXeJUL1uvgupw74+KSMNg7LFxI/1rdLUpQ==
X-Received: by 2002:a5d:64e2:0:b0:38f:21eb:5d02 with SMTP id ffacd0b85a97d-38f21eb5f2dmr1041208f8f.22.1739368761091;
        Wed, 12 Feb 2025 05:59:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a058930sm20853795e9.17.2025.02.12.05.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:59:20 -0800 (PST)
Date: Wed, 12 Feb 2025 13:59:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Ian Rogers" <irogers@google.com>, "Arnaldo Carvalho de Melo"
 <acme@kernel.org>, "Howard Chu" <howardchu95@gmail.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Namhyung Kim"
 <namhyung@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, "Kan Liang"
 <kan.liang@linux.intel.com>, "John Garry" <john.g.garry@oracle.com>, "Will
 Deacon" <will@kernel.org>, "James Clark" <james.clark@linaro.org>, "Mike
 Leach" <mike.leach@linaro.org>, "Leo Yan" <leo.yan@linux.dev>, guoren
 <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Charlie Jenkins" <charlie@rivosinc.com>, "Bibo Mao" <maobibo@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating
 all system call tables
Message-ID: <20250212135919.4e7a26fd@pumpkin>
In-Reply-To: <0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
References: <20250210165108.95894-1-irogers@google.com>
	<20250210165108.95894-6-irogers@google.com>
	<d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com>
	<CAP-5=fUi4RYebxCGYZVHVEt0BpWVmUA6+-vDQfbai25_KJRs7A@mail.gmail.com>
	<0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_055923_498540_2CF42720 
X-CRM114-Status: GOOD (  10.36  )
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

On Tue, 11 Feb 2025 18:53:14 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

...
> I think the way it actually works on mips is that all syscalls are
> allowed in any task and the actual number identifies both the
> ABI and the syscall. In some variant, the same is true on arm
> (oabi/eabi) and x86-64 (64/x32), but oabi and x32 are both too
> obsolete to put much work into them.

IIRC x86-64 processes can also just make i386 system calls.
Even switching to/from 64bit mode isn't privileged.

	David

 

