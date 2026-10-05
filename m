Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148FFCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azL6RWzxNPLFbjqexUqOSuUWiCvD6BgcwHGYwvXeEQQ=; b=tK0FEdeGWnMMakDQI1c9x2iHMi
	9Os9LkQIn2kq+Z5xfPLURcwulBGP90RRwc3GI+CVKjSzo4WeoDNApc5AC+cDya/cYu4oI1Tr2jnBy
	4jpOCS1+FbaBAZZdzAmHHW/hZYbqnILbmF4qYiFurOhDjID4VN4a6NLhjpQvn3KXY2nsr6uvsUDLG
	Dv7euuyQYaJA6YRrOF7FasZiFp0k4aWgmXRL15WBbT3haxfW8YCgdCkiSDlNaK9RE/EFMi/FObfhe
	pGgVFCosZxrwW+HEZzuO0ZGl0cfuz/YcXbHNvw4kHAOynSc7QsmjaEVACVmOIUDwSdDug3GR8jydJ
	JFxttMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe3p-0000000Fsxa-1Pcz;
	Mon, 05 Oct 2026 08:28:37 +0000
Received: from out-104.mta1.migadu.com ([2001:41d0:203:375::68] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe3m-0000000FswD-0vig
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:28:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=azL6RWzxNPLFbjqexUqOSuUWiCvD6BgcwHGYwvXeEQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791188911; v=1; x=1791793711;
 b=U0H/bsw7+TDb9QXyxEZ/AQJFBxjCGWFWzx8wxbRswus5Aortw+hnirb9iNXcSZFjQjkkyWtZ
 Mf0uUNZNRosNDeY16L1qvmLcm+CLCntqDkhdkkMfF6VJ4Zm6UYuDYcXcHvTBa5cyGrBtHGZ6TEL
 aQ5YSxO5PvuR2dRvEJR5SmXE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0f515bffc3b7d3a7;
	Mon, 05 Oct 2026 08:28:31 +0000
X-Mizu-Trace-ID: 0f515bffc3b7d3a7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so3587e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 01:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwF457OwlVOtg0FtNAoLv/EFdg3CbdFOnuUaLhjENv8w8h57xqsSZfzGSbclProBdCbSeLrskWc9Xh96jdLvbdA@lists.infradead.org
X-Gm-Message-State: AFq9FYKTNKAr5BRtlYCw1LwgC1jeWbeKyoOI0HJCyYnYsB2HGbjLbYGK
	n8UQII0RQOmJ7x3zGtVU539KWcCS3VIACv5cGtfT3xUiZPxfmTNEZE+VPMyuVYAbqyETAa6qdZ1
	UmNVFyfdTU6pWLLk/Qed5/8oDuM9dUMnbYNxGIH44
X-Received: by 2002:a05:6512:440e:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcb62cfb9dmr110049e87.13.1791188905794; Mon, 05 Oct 2026
 01:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261005050349.836795-1-fuad.tabba@linux.dev> <asNdAXGkxagm88Su@kernel.org>
In-Reply-To: <asNdAXGkxagm88Su@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 5 Oct 2026 10:27:49 +0200
X-Gmail-Original-Message-ID: <CA+EHjTxG=JUc7qERzdkOE4hEMUVSWK2AUtcR1JJ-k6S0m_RxqA@mail.gmail.com>
X-Gm-Features: AclHuK_skcmiWKYt-g9sV07lqcK6sGjUvRohlQWsrIQerdG0YwJX1vJl3n2KYq4
Message-ID: <CA+EHjTxG=JUc7qERzdkOE4hEMUVSWK2AUtcR1JJ-k6S0m_RxqA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: selftests: Check SError is not pending
 after delivery
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_012835_013111_8BED107B 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Oliver,

On Mon, 5 Oct 2026 at 10:17, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
[...]
>
> Can you add coverage for the vCPU events state to all the test cases? In
> addition to the case where the SError is taken, it'd be good to assert
> that the SError remains pending if the guest masked it.

Will do,
/fuad

> Thanks,
> Oliver

