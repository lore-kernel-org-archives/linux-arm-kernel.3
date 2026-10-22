Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45CF606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DHY5hGkW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o7mpC5m+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QvR2u7W5gGpna7paBb3zjwV+s04vzn7FIqIkuyCNIqg=; b=DHY5hGkWQ9BBHL7P3M18LTrGJV
	JAoDO9VSPoF5TnVqb9BQozE4wPkg/D08Jc5mIBoL0vtTlRGKS+M/sXpGCxHAICgHnmxSjitNc/irU
	m/n6K5mrOfOu3XKmzSgsIDXiVgqn79baul2E13Q078GDXm6b8xf0yll8vhxtZWkVRqkr7vYh5H7T0
	GBuycdHI/jAnS2eo5ooxEVr6OIk3R912kMt1wzOwuMe13bMgqjvQJTZB7iFfXYNed75HjXBoW+zQi
	Lcwo7JsMZbbI/jtgS88JDEnJB/GbY5qoESdoUX/w0ozB3DwesupLehoskQOcgT2U4f/G+YeoRqXbg
	wFqQregA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsEw-0000000E5mq-3vkE;
	Thu, 22 Oct 2026 12:49:50 +0000
Received: from out-110.mta1.migadu.com ([2001:41d0:203:375::6e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsEt-0000000E5mV-2f6V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:49:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QvR2u7W5gGpna7paBb3zjwV+s04vzn7FIqIkuyCNIqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792673385; v=1; x=1793278185;
 b=o7mpC5m+Y1MXLN4zOzrOGIAlvv7EVTFpZndyDKCHGkMQc8LeAJvYE3FG5rjmKOepBSQ3cqHu
 aLBgThOhf0bkS5+mnA/ZA6LMJFU+jHham5K5kd8iJRAkCt8HWGzh922t3FGDXtH37mKVWouzVdw
 7sKtIiDoH5FEK2aQnlGhmZ9w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 660bd1fe8f6edab8;
	Thu, 22 Oct 2026 12:49:45 +0000
X-Mizu-Trace-ID: 660bd1fe8f6edab8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8951e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdSfyE2KIaloCT7f9LYKVLMPK1QSwO0QgKxCCUFwWkWx29uEBLANXNoei5mkpHd6N1sr7cgHKqK2mgOPEFgYgB@lists.infradead.org
X-Gm-Message-State: AFq9FYLOBz1B0SwH0IBkMECWDaeNJFmdoiorr0HazQvdv01fsXUHrTkK
	8Wafcw1+yASUjfHgC8lkxY0i9VQ1zZBFjrT3s+VcA5CfuPwt/daYTOIx684VeGYer6iVc/oFSih
	ojP7O3AEtn2NRaDbdCv1SUgq1Nv+Q28QyHla+GCzf
X-Received: by 2002:a05:6512:10c3:b0:5be:58ad:1ba4 with SMTP id
 2adb3069b0e04-5bfa8491692mr166044e87.6.1792673378383; Thu, 22 Oct 2026
 05:49:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022100319.3046476-1-fuad.tabba@linux.dev> <86ik2uymnc.wl-maz@kernel.org>
In-Reply-To: <86ik2uymnc.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 22 Oct 2026 13:49:02 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzo+NoM0m3cjuVGW0EZjuzRt3pJvwFC5QO6=g8AYTC9pQ@mail.gmail.com>
X-Gm-Features: AclHuK9FL-kWa8J9l8GOe0KfCzxWBz-UvvDfr9Sh7jKLeEaBWko1cn9SH2Ay8_A
Message-ID: <CA+EHjTzo+NoM0m3cjuVGW0EZjuzRt3pJvwFC5QO6=g8AYTC9pQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Don't WARN when L1 sets IMO and FMO differently
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_054947_954212_AEB0FCD0 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Thu, 22 Oct 2026 12:56:07 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> No. Either we fix the bug, or the WARN_ON() stays. There is no
> alternative.

Ack, I'll look into emulation instead, after -rc1.

Cheers,
/fuad

