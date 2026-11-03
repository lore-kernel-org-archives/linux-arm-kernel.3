Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC55606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4q62QPp2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LrKY1t1M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q9qnXfHVWDfmE9hIzIuxQlA5TNXMmk+3sfayKRD7PX0=; b=4q62QPp2X7IO2mB4Lf8g7/y9mP
	Y25WemxgTzt7nNkPrJCq1vispUKvbhjscks7Rn2I7k0A4di01UAapid2Fxmr+hOa9wrCTSld8JL/l
	8WeUNOEURQUadIMQwky5Ks+TKmQIYrFqXL126W9lhJlJbX2/5BVIZduWyLeRIy/o8JGXO8PNMznFc
	WzogoBGYtO0Z0dbwRy/pjFTylOZBSbBh3DMBjI+voNskFZKRZMW/Z+jeoLKDyenQMU98CaED+OxGH
	8d5MXkqAWTlQ+eiYyIJvNSLoVoEqP6dKh+0PbwtHzAA3c+BOI3nS1dq5KnNzXITEHFpzhPfX8/20i
	EiTJxYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEmL-00000002bEn-0rzk;
	Tue, 03 Nov 2026 13:42:21 +0000
Received: from out-251.mta1.migadu.com ([95.215.58.251] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEmI-00000002bCz-0j2H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:42:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Q9qnXfHVWDfmE9hIzIuxQlA5TNXMmk+3sfayKRD7PX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793713336; v=1; x=1794318136;
 b=LrKY1t1MCN7jjtz+TQkZQ/1Ftsq04U9A9gAfR7GX66J7a4DzGCztH2sgpsHnI1+7qIVBNK0O
 Yqxca9h8+zQWyjkz3E4d/9cw+UxQ/dR79FrxO3quHzEThtlpcDzxQIHqycLuT45hqT9Y75f/ZwQ
 1sxXRjbkx/fgm7CfTL3HN/kI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6d6f170f92e27e52;
	Tue, 03 Nov 2026 13:42:15 +0000
X-Mizu-Trace-ID: 6d6f170f92e27e52
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so5737e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:42:11 -0800 (PST)
X-Gm-Message-State: APuU4Z/RjVW1bwKWytsuYSAJ8MzswaENomhhZJLWvJIxt7fY7eyqcWzD
	pQChFj4IjPkbsTwiguPsLYdNJRP2ewF1kvBf88uTofi1YX9WJOSxP0nB9umzdWi3012CMD1ww5I
	Ei2T/bwcWyeD+coHIUDyyo5MVM7NFXr1CaiprDpnr
X-Received: by 2002:ac2:5385:0:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5bff060c331mr94794e87.12.1793713330954; Tue, 03 Nov 2026
 05:42:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-2-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-2-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:41:34 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzKKG-F4aCRiCQsJOspZJWgKA6PjVasEcf_qP7W7H_Z_A@mail.gmail.com>
X-Gm-Features: AclHuK-eWl8epl3U-D4A5JlaL5YUw0LbIVdH55Fk5BPVD-YR5A-BnAm0yAolBPA
Message-ID: <CA+EHjTzKKG-F4aCRiCQsJOspZJWgKA6PjVasEcf_qP7W7H_Z_A@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] KVM: arm64: vgic: Split out common LPI allocation
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054218_356892_92A87B67 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Mon, 02 Nov 2026 19:44:39 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> Initialise LPIs as Group 1 before publishing them in lpi_xa. GICv3
> LPIs are Group 1, and another vCPU can find a new LPI as soon as it is
> published. GICv5 does not use the group field.

Two nits: the old vgic_add_lpi() already set the group before
publishing. The comments in its_free_ite() and vgic_alloc_lpi() still
name vgic_add_lpi() for the GICv3 path.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks!
/fuad

