Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQC+gEa8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4zRKXlp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=; b=KQC+gEa85+Mv96
	zuXJLyJMH4hv67RYsE2lyq/xfql+OB6cmz+BiFbqoOE9aZ8+xyikFUogMs+vZwxFi4h8K9iiZTGhu
	1HNQYS6IMtzsaEKOVYRgwY7NfLmmvF/e0oO8dtNU7wYI+78NPYfrLuf5ZHPSL0uzN7T2DjFNjOXDR
	LdX5kURYbjmxXpimU50/rruOMEsjGdaf6pd2HNzD/c8kgdH/USNIcUa9Hm/kZMmOVFpp4ncm1Kzr7
	VIm+0QwQ0mUOKeeCMHJymZdwmoZjhbG3konEANFL1n7YEaSGf0comvTyWQQyLvl07L9TjbpweJi2e
	F1s1DqRuBaRV/tCsocfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRIG-00000009Xh9-1l6b;
	Thu, 29 Oct 2026 14:39:52 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRID-00000009Xgp-3Zm3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:39:50 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-14fc585291cso1992547c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=j4zRKXlpidZ5jujamJU85pU1gybBZVILLWPDXQZC4qNOhJgrlLRwKK69qtQ81wR++f
         AOAAIT/1DOpsjCu51F0MbAikexs6gRmFAJskz30BdLb1yTOOHQRye+x1zQGiCjv9rAjO
         xWDxPVWbST7Q2igvPvwTxcaG04YNzs0zhHD+zdZMwm4UxEAXFOWmNhZrwpEmiz2U1921
         PtHcqKtIZPl8gx2xlzHiZj3Kefpt/fYcKt7FgxOUTYum6JmxbJVtqhNj3m+VaiEbLGC4
         UtDJ6R3TSXjnOS0ylgFtUYVPHL9A85P0lYvmZ9HMnRGbzVl9+hR2jM1P+dAVibWvP8SG
         VYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=xhsKvnykRHXr/v2WfF0u54Vv024vDVv2RIq2a3b3KhYHVyDWjUu5BYsAn/3qk7Mi0j
         ETPc3/zST/TFt2RCQNle1PzBE7iOPNw915alAemlj4YqLVQrvbjpuOHjH427tQEzQMa3
         TmrInl/G5d4Yxazkv/RpCBkI6Sk6bpPPWB428LbScR/ePEX9Hb7EqTpBvJGQ3LE+K05M
         QUdxNdWX5qQLWna/MKzDHV1ezOOqXy8SvTQrP7Cf+VDgnoX1uMfOxl4DSNGI0oD1jvia
         N13EJ1AksvEOMK39kcq+JmJO4tAjs/CkABf7VrJ543VxXkWAucHQcjJur5x6E0RLKGcA
         amtw==
X-Forwarded-Encrypted: i=1; AKwUvByxzcFgYbDKRPc2Cpmn/KgeuqL/yr8KFrnXJ0JxKHpySYUaKC/qVhRj1xTr0WUI68K/Adf874o9zG826pHIdb2x@lists.infradead.org
X-Gm-Message-State: AFq9FYI/2JubKMVm+dWXYNJIUzWO7mellzNf9t7GaglgamhEG8nbtW6R
	3ooIhm68Wyx2S09huOyzzd4+xw/nHlD/rvccYhr3q7+qsyXHbOfu6W4=
X-Gm-Gg: AYBFou2JVo5UmqBJxhGb4yzIUUJCNLhpycMeGrAAcUs14WVsMrcocopeNoGq68gA2B3
	vddoJjKeFRdfaCapzw0gmiJIcU9ugpUkPGf2t2GCPy7ISVOzA5jvcLIHVfh4X3uAGypvu+jl2Xx
	+ZHHmq3QmU+xd0teaOpabbeDgpaSMWDOyL+9QRrPJnCO5sUT097CZ2ItsIb9dG77i8HAuA9WnsV
	ypO1fcgpTYZpYcxwQCcwB1HaILUjYeWsYxt3gF7NExw8P3K8QZ6uHoyyiwly4JLxH+MgvMfEehA
	nXaX1ugG5092eFGzttkPJBynb6bx7bg7TFNJ629yP6G+6QcfyMmbG2+nvjQPDHmfIkowV/uGzpy
	6T24vR1sESIfh9HGV1Too7I7FNqUxYccxngwFAUuYrl/tM05vGkLBsvq++Re115m1tO6cPV472m
	H4+N7rqmVtmO7Aw0d6ZVbH4cANsDBocb4jW+g26u+iucOenieVjsIfccjgFosiupAXAS/gCD5dj
	TjHoxgQnKeQvxU6QQk7Z1V6w1nnfhci42NFvkzW/RNfQ+QOuPc6tmAFYcAJI6scaMNFtU7YLV9u
	1MSfOvhvupdZHGNMgI4yWrng6NuP/iJL6q9sZwQlH/DEnuCjyUfIJP9hndf7u78Ny00=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_073949_891358_AED18749 
X-CRM114-Status: GOOD (  10.04  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?

