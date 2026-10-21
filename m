Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nmRMQQPb;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JWYz/BDb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh9adS1hWGFrVRHbKh++Je7qyXxMfA8cN2D8AczDFWM=; b=nmRMQQPba8PM/ethH95BgitkcR
	JyGUfLcu0E8cpPDmdY5ygrgoxaVm/qoTccfPNW6JSZCodoHGCME5IHAPBEk01A2iDN1O/aWgx8yZm
	mhPoshK+kGUFwDa+W4XvZ6MyskF1SPqxaMTEiqow/2f4YAnI5t0YTqv3znK6xu9nryQDcmVNbGE0y
	F2E03aj+L4sDzYIg6WILmAB3evfaE5SSsH/0Y4baWNcwp9/ThDkdAVBi6QCvHI872WJUDxEa3B480
	AghttbY8G4FC+2PMjwl/FjegpuAmLmnvQGeeITGdqpVxIY+iHKdXe4nWutHOUmbiBRs6jR69hJ9B9
	caRXlWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVm8-0000000BqBD-0obY;
	Wed, 21 Oct 2026 12:50:36 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVm3-0000000BqAj-2Wo4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:50:32 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2756671a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792587029; x=1793191829; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sh9adS1hWGFrVRHbKh++Je7qyXxMfA8cN2D8AczDFWM=;
        b=JWYz/BDbsi6y2hqIu7OYOiai8a7cWkDbuoCO/wN3zXgrrWfQtUUcjdOay6xNmx6pXn
         +A7NkI+FQSyi1DGo3z2dVXqAj5FKwBpDKrQKqVMkyW0YUOSYtBLSZ5YqaEOKb4scNSLx
         Oozubsj7yyOPCDvToCILF1gs+culsoCK/Ap7kur1/4UiMOzrpJWUlgy1EkFA7OGzbaiz
         fauq8akwsIsY3xyx5Z/EaWNluxeQxZwPaCHEv7W8e1jom9FcUc4eCanK0NJ5U6Rv8eTz
         a+qA9CQa4HVcibTGq3WcUhbnRtzjPKhyduL2AV6xajPXaYKxsh+l/C6RoNVWxx90r7Ol
         /YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587029; x=1793191829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh9adS1hWGFrVRHbKh++Je7qyXxMfA8cN2D8AczDFWM=;
        b=oVGs0c1vr6/NV0Xtvut0tsJJDqFDUme+TRaCEM7DFYvtDjANZsxWPRZYkJpTNSG5aS
         +rJBNftKfQW6mDK38h21Xgo8nFbn+OSmiIU8c/jLoGzRyDCrC1es5vfP+hVqsFSp88cy
         ATNANZwMJgGHvDCG91s9zNaElP9OtVpfXpMIzMIOCpZ/ZRyZumNE8AN3Ybav8jy5qpsV
         HRzmPtdlPDVbmw0EalTSWg8KURKOyQ/9iKpBbg5i1Nxzx41Il/71aNsqZWVg6fEzJ6Qo
         Zxr2InP6AfMFOoOG+wj1MJiSQNryhL4Hn6U7cY36OGejCML0H/t0A1QxafSsZBtmOaz3
         9RPA==
X-Forwarded-Encrypted: i=1; AKwUvBzCB2e3zgvhzpwpyk01/T1pmYO5SF7cREN8rIQyFWFV0kEJ0MA0Rj61IPalildemicMoY7gM/GVhYcey4EFJQzz@lists.infradead.org
X-Gm-Message-State: AFq9FYLeXnDisy1FodApmy6++k3oT2zN2K4gmhbwNaQSU7vczNSS+W0y
	FdiqXmDBbiCjClMRarOl3kZSUPTJfC7XKhiv/+ozc5rPEXe8N+FVS067xfh9kuMy7g==
X-Gm-Gg: AYBFou2hlqDumPp8B9Bs8EGR1XFv741oHw0VB1KH24JIfzUH76xC/Co4l07Zd1YP4lv
	U0Edmx8OKcLoMf/xXvXMwMtWQDtfitlaWeB0jccpFAJ5lLi1bmf+UuHeUQz9++XGXSTf+REQ8J9
	veSJSQh0zh/9kQMKZ3Y0gYh3pcHumB5RlwP7HsQcUhMSuSPdo3ugvlJ81s0ORiDz+WGA7n+hUne
	WPJ5Grh7LFvaX5BS/N04Qv/9av6mIWbmovHiU2MXiubm/EGoSZvI8Fzb40Rfphqqchq0r5rz0I3
	hPMTRW7uUe/xgoav43oKlAojEHn7HDrewaZa+4ZxjTJ1B2WVcGGtcns8hf2tVZbWfF3PjQjqLNy
	ttHrz1VLeaQ8hzYzNdApduCvs0WezNQyOhs1DUBW7oeDK0jOV9LK5RD3/wFkgI1PM9Wi2ReMVNM
	q69ZB25L7bFNopmChhrTMfnqrLxAtZQKezxba951l9Wa2aeqqebxesxP0cadtogCUmzf9BQuUq8
	ZilzbCm/17XYeFPnuiuiexj2JxXKvdkWzNuleeX2CA31WiajgNB71pqDb4H9IQD8yRMq6vVVC15
	F4g1R7joMF7y/Iz0os3VYLQx
X-Received: by 2002:a17:906:c114:b0:c2e:22f7:59c5 with SMTP id a640c23a62f3a-c460370aeafmr447928866b.7.1792587027947;
        Wed, 21 Oct 2026 05:50:27 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5acc9sm74841366b.9.2026.10.21.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:50:27 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:50:22 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v1] KVM: arm64: pkvm: Clear GICv3 LRs in the hypervisor
Message-ID: <ati1DrtmMd-63bIN@google.com>
References: <20261021110000.508827-1-vdonnefort@google.com>
 <86qzhjz1iz.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzhjz1iz.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_055031_660385_80DF1EDA 
X-CRM114-Status: GOOD (  19.57  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 01:22:28PM +0100, Marc Zyngier wrote:
> On Wed, 21 Oct 2026 12:00:00 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > The LR registers are architecturally UNKNOWN when the CPU boots or
> > resumes. However, in protected mode, only the used ones are reset.
> > During boot the HVC __vgic_v3_init_lrs() is never called because
> > vgic_present is only set in init_subsystems(), after cpu_hyp_init() was
> > called.
> 
> Why don't you fix this rather than making the init even more
> different?

Ack, I'll make a patch to fix that first.

> 
> > Also, the PM notifier isn't registered for pKVM and the HVC
> > becomes unavailable after the host is deprivileged.
> 
> Sanitising the LRs on PSCI_ON is probably the right thing to do, but I
> don't understand why resetting the LRs is out of reach from the host,
> given that the host is fully in charge of the interrupt injection, and
> therefore controls the LRs.

I suppose I could reinstantiate the pm callbacks for pkvm to at least reset the
LRs?

-- 
Vincent

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

