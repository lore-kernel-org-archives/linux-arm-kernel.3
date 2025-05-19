Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D17C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRKTNHfasU8+lo/XRIkxokS5HAPWIZgFKA1nHJYL56g=; b=I5+LiUxjRsXgJP44EObfkDxbLd
	ZqBhwKGHalRWOXH2oHIcw8DVazCQi5FMh0oWUfrzT87HtJIlLTHrHsfGEkgNP37KrA42OOxelpApA
	h6zBrN7u9IN84ktulhAviKHbj/+x2pNAda4SXGOU+v9CQYag4nYZPGQEUFQTPQ7nMUVqNaqpsE4aX
	Cn8G96dIfv3NsqeYbedLwOg6bgZI6ut8aI6DUhU3+RZS9el+i3PawRcierdBUJDryXRJDrpSCHPhl
	EwejqtDVgXXB8cIpVsA81r/8svd1qXMhDNbnNFxa75XxH1Ex4ONfudWVpLxgRCRuPMbdwzOJGMYSy
	55UAiWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4WB-00000009zom-3OVY;
	Mon, 19 May 2025 17:43:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3o4-00000009tAA-3Zo1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE322A4E533
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 16:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C671C4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747673859;
	bh=IRKTNHfasU8+lo/XRIkxokS5HAPWIZgFKA1nHJYL56g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oNOIRe6lZs7jzW6yF8dc/2pf+jxK9H6XJ6yGxQb7WUVmS4MBMBIoRoxO3s4tLxvPD
	 qCHZUZ2TcZULip9ppmX4JKa47qerHL330KIOW2kCitvaolZyVZoQDvVma5aAmqOYmG
	 HdHfhz5mWE6y5F3MGctO7ehNrUmrlRZ5JHwYNx1BPqruAzXBMDwCmQ7g5ZkLIlnszu
	 osLehQG5He4sWXdVGHNWMRBBIcZLk7wVuV1ntYcwJXL7/9vjnlQrY2h01/azYxa7IE
	 sXSHSicrNYXdHkzX+V3MgS6NNs5q2FsAjqCDhDYrOUiF2Y3O1qIYvAGYD7opo+I5PN
	 6FPwDtjuo+3/g==
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47677b77725so48382791cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:57:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YyYW5MT+EkY33AMqSkP8NoMFDYxilLJ3hGR8d4yc3/Urd/JnY8j
	IacwgLnxdQuEVjQEib1f7u1x5G8inpwXE30jJub0GB7t5DM6TAj9kfRn+9RP8Be1qVcUIrotUyJ
	MupFMM/w+/lvLyaBIecPwNd3HWuINzoE=
X-Google-Smtp-Source: AGHT+IF4eIILYLE82QhVaFVC1hc40xNHoFgLB4h94upYDsq2OsAWvZWF03w5aHy3ywmb0cwEeuEgMULJtrLNil5Qb+Q=
X-Received: by 2002:a05:622a:2610:b0:494:7c90:da18 with SMTP id
 d75a77b69052e-494ae47daf7mr251639231cf.38.1747673858027; Mon, 19 May 2025
 09:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250320171559.3423224-1-song@kernel.org> <20250320171559.3423224-2-song@kernel.org>
 <aCs08i3u9C9MWy4M@J2N7QTR9R3>
In-Reply-To: <aCs08i3u9C9MWy4M@J2N7QTR9R3>
From: Song Liu <song@kernel.org>
Date: Mon, 19 May 2025 09:57:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4UVkXdShpo2TvisPhr6S1jFPkS_BKXAjN9cT3=k5SAFg@mail.gmail.com>
X-Gm-Features: AX0GCFuUA2XAT-QJ7wQt7Tq4_RFoArpXkaTjxNGeXw5LP4FBthHONfACFli45WE
Message-ID: <CAPhsuW4UVkXdShpo2TvisPhr6S1jFPkS_BKXAjN9cT3=k5SAFg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_095740_964101_E09F804F 
X-CRM114-Status: GOOD (  16.22  )
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

Hi Mark,

Thanks for your review and the fixups!

On Mon, May 19, 2025 at 6:41=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
[...]
>
> ... and then in future we can add anything spdecific to reliable
> stacktrace there.
>
> That aside, this generally looks good to me. The only thing that I note
> is that we're lacking a check on the return value of
> kretprobe_find_ret_addr(), and we should return -EINVAL when that is
> NULL, but that should never happen in normal operation.
>
> I've pushed a arm64/stacktrace-updates branch [1] with fixups for those
> as two separate commits atop this one. If that looks good to you I
> suggest we post that as a series and ask Will and Catalin to take that
> as-is.
>
> I'll look at the actual patching bits now.
>
> Mark.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/ arm64=
/stacktrace-updates

For the fixups:

Reviewed-and-tested-by: Song Liu <song@kernel.org>

Tested with 2/2 of this set and samples/livepatch.

Song

