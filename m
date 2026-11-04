Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A33B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QpUeAb5h;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxuPc+gT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=; b=QpUeAb5hs5J1WHaUkYJk3NndHt
	bfxHdIeEQ5LIY3pcrUv6ekb9R75uTZa68bncs42P/NCAtSU/nlnZxzm0jvFxn25cw/QlZofHrHSC3
	hk7TvB72cJ+BedDKs4OGWaepcHJ+poCPd9jEEFbK8Y/q0ME6YUlLjTTlFobG88Rc919QVvWNkulug
	mE4H/o0XvIThgGy2/jc57D3MUI4+TEwPnsbgNBqxNk4WHKqw/LrhA7ouje2q5kJJyDglGBthf3WCY
	pyf8l3/4yBmMlFH3AuMMytQez0c913hNumVFXjC/DHwJ4alDjVOBq4DDF6Bi/xwoU30f66eROaS7s
	tjcTcNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZFs-00000005Ahn-1n5v;
	Wed, 04 Nov 2026 11:34:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZFk-00000005Ac4-4BZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793792041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=;
	b=VxuPc+gTAgOVFdYNF++m7FVE5TTERaY1I2zCvLYZSgcHJ1LMcg+3ve76+sPYVh6cErMpKj
	2SZxUsUAA82KpeLNFnMddSpufsMojQJLv+4MeWL0bwaU6+yMJYuhplyyNnN9GOzZm1q9O0
	8o1IX2uNWrOUk137nARcCalR47Pzys4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-F6eEbv0oN8aGsYPLI_UMZg-1; Wed, 04 Nov 2026 06:32:20 -0500
X-MC-Unique: F6eEbv0oN8aGsYPLI_UMZg-1
X-Mimecast-MFC-AGG-ID: F6eEbv0oN8aGsYPLI_UMZg_1793791939
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a4af69e06fso4539995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 03:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791939; x=1794396739;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=;
        b=G4/e9MjT1g6syyVIn/V8Qq0CnerlmdfNLxBfCAD4tSNZ8YyXVbVZPyZWA2voIsMKDS
         nE7x5hcHcdUy6no+rTPFUoGfEo7514U8IywIyA3lcy74yJ5/GxycqlEquG+hT08q2k+g
         M/79prutO4ki7Y0L3uXpnbPZheXZ95M/dJJfUbQ1m0mEE+OGrvtDY+Hhkcot/BtY7KAn
         KA1dO/ngfNfCQgzKPr7qYTTRjDe3rVo8s2sraqTYtp+60bLPFfM/b6kYehTlY0qwDmnl
         BS9zeIUdafSPsRd+l35v7WZdekIL8XuJCqShAj/BAetoQkwWXTLDfIP7K8MjBiAGn3VO
         IFOA==
X-Forwarded-Encrypted: i=1; AKwUvByw1bcWoNpMI0KGEgvCRaP3MtUac2SmqHYzLqP/kUM9RxHlRlnbn1D74ojRZra+Q7GORT+ZNdY6yk0xhtTmrCH/@lists.infradead.org
X-Gm-Message-State: APuU4Z8jvsq8R+XUb8x54uKFRytRFKR3kUrbNbVy91ye39SoZW3p4E2H
	4XNgxBO31R70v5qpp2klLylPwU/LOw+iBYZ8Gwen550zzlPmJD3Me6nCYVThgBcm8V7l0lQPBtD
	Qy58OBXVFF5LLU3d9NIFmRHMv1O/AfK/hIxr0hx8hHzG3zDrtl5YnIdFpCLC60XuyN4Dzosr8ix
	/K
X-Gm-Gg: AYBFou0hBiQwG89ko/UUtex6Sl1iSj/Zd1xVk1puv97Hfe8C3107VSqAPfc9tjdfp/9
	sWYVk0C/EOta0DTCqNNeKvhdBZ/R1pRCTY6kmg345fl0y5oPMYgAjdaSIP7OET47SGWZbw6Wz3+
	04+2dszEIVzn7dGi5WWk+TBecXeHMCOq50WdxQfJuRU8HOt7BeZ75gaPRZyuhlshskddnsIPm/m
	jLfPxcRN2F6GJtZ7yFgB7p6nZHppIxG1nupKC5cD2qodF5AKlgjxoxoduE2iNizWZuJaLDmi29b
	YYfbBxv+6xQs9v5UelzknYbkx7pNQlai+dbq+kcvETnFMmvQmm+DG0HH2vFMiOr0Zau8jkZo3oS
	FQrWqHnrhdaEdxI/Ueyqsc0dEnUzjVrsuMZdnrOeXoBKvXFKoqQkC3dSXyGsFC9/tnlWiAnNxD7
	SOSgvKhorcdgaphEJ6ztlRTBo2zARPpUkGYM2oNg==
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr339637865e9.32.1793791939085;
        Wed, 04 Nov 2026 03:32:19 -0800 (PST)
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr339637545e9.32.1793791938760;
        Wed, 04 Nov 2026 03:32:18 -0800 (PST)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de. [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm60945795e9.3.2026.11.04.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:32:18 -0800 (PST)
Date: Wed, 4 Nov 2026 12:32:17 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Mark Brown <broonie@kernel.org>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
    Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v9 1/3] KVM: selftests: arm64: Report set_id_reg reads
 of test registers as tests
In-Reply-To: <20261103-kvm-arm64-set-id-regs-aarch64-v9-1-ab32bc79fa9c@kernel.org>
Message-ID: <4df3cceb-0d07-d787-b5b6-0a28433116f3@redhat.com>
References: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org> <20261103-kvm-arm64-set-id-regs-aarch64-v9-1-ab32bc79fa9c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 95p_Q1n7T8yawBl4J1uzsbi3dgRhSh8WEA_VbYZO4JM_1793791939
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_033405_499111_1E6EA151 
X-CRM114-Status: GOOD (  14.45  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026, Mark Brown wrote:
> Currently when we run guest code to validate that the values we wrote to
> the registers are seen by the guest we assert that these values match using
> a KVM selftests level assert, resulting in unclear diagnostics if the test
> fails. Replace this assert with reporting a kselftest test per register.
>
> In order to support getting the names of the registers we repaint the array
> of ID_ registers to store the names and open code the rest.
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
[...]
> @@ -684,11 +719,20 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
> 			REPORT_GUEST_ASSERT(uc);
> 			break;
> 		case UCALL_SYNC:
> -			val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
> -			val = reset_mutable_bits(uc.args[2], val);
> +			expected_val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
> +			expected_val = reset_mutable_bits(uc.args[2], expected_val);
>
> 			/* Make sure the written values are seen by guest */
> -			TEST_ASSERT_EQ(val, reset_mutable_bits(uc.args[2], uc.args[3]));
> +			reg_id = uc.args[2];
                         ^
Minor nit: this could be moved above and be used in 3 more places.

> +			guest_val = reset_mutable_bits(uc.args[2], uc.args[3]);
> +
> +			match = expected_val == guest_val;
> +			if (!match)
> +				ksft_print_msg("%lx != %lx\n",
> +					       expected_val, guest_val);
> +			ksft_test_result(match,
> +					 "%s value seen in guest\n",
> +					 get_reg_name(reg_id));
> 			break;
> 		case UCALL_DONE:
> 			done = true;


