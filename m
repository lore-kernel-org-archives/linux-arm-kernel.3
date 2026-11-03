Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F431606BA19
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wU3jPN3g;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J4n1E2Qn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qwRz5+y1CfI9kDi1iQPoKBCcgpmj5BKvbsT9hE1zi3s=; b=wU3jPN3gqFnM1K6s+GrlyWUCY6
	bX9gVZRhiXk8Xsff9rcV1VlnYn26ZQGTdE6GrlI07PCzn4+JJYLzH5n+3or6qlBtcASUtRS6A1U5m
	2QrVkLggfPP0578rYgTR4/9Tov2YaXGMaRexQxoc5mgyd4HCXjXQvJ7JDgDu/NkypRWk3uboTURpl
	RauYezdBit67lvxwqKvgBCVlsAiJXMjS9HWOx61ryJY65A7XEmfHobQE9EVb35sVkEWUgturc1BQd
	80UNbjKYAC7rC7qikwvj3RzxL32oWiYbAQH+ieyCeG6Lpd/kNnFKsNwqpp4dx3XL8h8ry0se0ZVcq
	4a6FiBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFoT-00000002lk9-07Ru;
	Tue, 03 Nov 2026 14:48:37 +0000
Received: from out-35.mta0.migadu.com ([2001:41d0:1004:224b::23] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFoI-00000002lUN-0hEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:48:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=e0EHDUYXYwJ2tFPCvYOXU9vuxX2TbQCMEHzWm7MGEI4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793717303; v=1; x=1794322103;
 b=J4n1E2QnIchzGpQRcd2gQy4QScIyQTZKlJoXVT+uzT53zqSmT+OZuhP2WHC98OejE7jhb7vd
 dO+aa48FDTTzIQh2yq0ee80tq3NGlxYJ2VNxPFuO+xVDHbN2aMUYa3az1WZUufQBJV4a2cqQVYT
 XBPlo+pOPBQXinkkB20mdlxA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7aa7ce5b2a39b563;
	Tue, 03 Nov 2026 14:48:23 +0000
X-Mizu-Trace-ID: 7aa7ce5b2a39b563
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7511e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 06:48:20 -0800 (PST)
X-Gm-Message-State: APuU4Z8tJD7quHF3rrgZGrZQqhJ9+CRNIarcNlYa+beWcMMTeCsyoU7+
	9wUJl96NyEje/6R5/Es4swSng1bMwKyXAuf5SDiZ095Mp76Ycmlhewd8JAsnAeSsDwzzkeXOeaf
	RFuLyQhU9Ylc1PjYo1o9MUMaDOCgEwuTUG2qyaoRR
X-Received: by 2002:ac2:4558:0:b0:5bf:f067:87da with SMTP id
 2adb3069b0e04-5bff06787efmr94493e87.10.1793717299509; Tue, 03 Nov 2026
 06:48:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-12-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-12-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 14:47:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyLQKbSWJMb_7kLDiiU2mmgXCEGJo6eaOwq6FyP-0g4Cw@mail.gmail.com>
X-Gm-Features: AclHuK-qvxCnimx5eE-7K4X-2tiMTkkBcU6bg0FMihoezKrSPq8sjEYtl97L8a0
Message-ID: <CA+EHjTyLQKbSWJMb_7kLDiiU2mmgXCEGJo6eaOwq6FyP-0g4Cw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] irqchip/gic-v5: Enable direct injection in ITS
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_064827_010005_26D611E6 
X-CRM114-Status: GOOD (  11.56  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 19:44:49 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

This should be Co-developed-by:, followed by Timothy's Signed-off-by:.

[...]
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
[...]
> +static int gicv5_its_set_vcpu_affinity(struct irq_data *d, void *int_data)
[...]
> +invalidate:
> +        /* Make the change ITS-visible */
> +        dsb(st);
> +        ret = gicv5_its_itt_cache_inv(its, dev_id, event_id);
> +        if (!ret && !data) {
> +                /*
> +                 * Invalidation sends events using the old translation to the
> +                 * IRS, but does not wait for them to be processed.
> +                 */
> +                gicv5_irs_syncr();
> +        }

gicv5_irs_syncr() returns void, so a timed-out sync looks like success
here. Could it return the poll's result into ret, so the if (ret) path
keeps the flag for a retry? (Sashiko [1])

This relies on your host series' patches 3 and 4. Without them the
sync sleeps under desc->lock, and this invalidation races the host's.
Should the cover mention the dependency?

Thanks!
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-194164@kernel.org/

