Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LD3UUtas;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=poffux5c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h/NfMB+35she+i0TxY4peuXbshaf1B5IwLQii+ni3vw=; b=LD3UUtasgHjpNkWSNE4ybGDbH8
	Uh9AKyv/ss4wWCPAl3gMwsEAX3pZnHwhRRU3sLrS+8dZLxGCHOrLRwj31bllRD5OmwGewhlG66Fwe
	30HdY4uliKWwIYQ6E8pw+EzdNN9nWtJboKh0J0RWOOlVc/zB+YGwg6uJ070Xc6u+5ELKS6PjINVpe
	WHybtP+9TevPxqUFaCukpDna2Cf4EntWgFDJl0S5IC9StaTAQajv1ZmmiUUIf6rTkyhoysUIC+Jro
	CqXvGThMhB/VSWlEZ9z/CPtHZ/4Ii5/Pkvty+5SENRH1uCmljnwLHMikgqsmsKezWColtQaXEU8wi
	TAylnxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKADs-0000000FqS6-3bSs;
	Fri, 23 Oct 2026 08:01:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKADq-0000000FqRb-3sFa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:01:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso2621345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792742513; x=1793347313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/NfMB+35she+i0TxY4peuXbshaf1B5IwLQii+ni3vw=;
        b=poffux5czuirXd8ii8mQ/E/+5q8AnslYPSlq2muX5dzQN0pfsF9yYbExzYRc0FYDR1
         j7sZqnW/HAX30Lgw+td0C9xncdlzpV/9Xd748GzX8UCwnOB45YgYp3EAcnnIfasgQLSG
         LGvtP+83WtCgpiBBXt2LKwkrNJeVAU3sstF/ZDScHHNloBATq1BEHqeFC0ExUoUF4Vr+
         BO1zGDpz3K3D996ZtqABT30pvh5BplI3dQrRgH55SVMXU8Stptz0f9sb1OQ/OtzVG8UP
         WVwsaHmJ/9ATp/bAJnF3HYVLzrIjf1Uay4tYrl7DKVbDKqrJU+X98RRYCxlULAdlUT9z
         XfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742513; x=1793347313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/NfMB+35she+i0TxY4peuXbshaf1B5IwLQii+ni3vw=;
        b=HlBzzPaMriliPxG2vtDQANIB8/4F++NEFRabSKa0sWixSzcgLijEO0/3RIGp7keIGR
         RDP1Z1saWIMlupC7o3aK0JyYGoAffr2AG5AeLt37+kZU+ceMo6TPQJEy3OAnFO6zetjH
         ituZzyrykYKaK8Z9ktPnGT8r+ikYSa9PixxQCb/priZ/gOOteE+5AyUuKFSHafptRofM
         VgJI+8fJXl9XicTCFpOJ4x2xh7m5HU9iG+kySPFewiLl4pdSnAZMUMDoXJnoi/wpkMMI
         tTzqoo4SOCIMPKZvHD09eByVMkdCAwNvLLQMkiK9M8NcrNBMl/1r6eOyuSe1dYDfWtqm
         3OxA==
X-Forwarded-Encrypted: i=1; AKwUvByZrgMq4Um0l2AKOISARe8VuMcn9qZV0rjA2A1H4YOgGL1ex6bfv6pCTlytJTKTJjL0IiFEQoHXnn0jOwF/UlGO@lists.infradead.org
X-Gm-Message-State: AFq9FYIU8EdiLrjs4gdhKxi1XE5AZdpSDpR2cZdjjECQAdlTif6mK0FO
	jjZhbTPrcLZIevLYfXlJJrIGwoY+0UHrHHSbmUHHy4IaPlHZkZELCoFqUPWQ1JBYjg==
X-Gm-Gg: AYBFou1vsG0B2GfpglI+MlaN1N2UGTYLegVoOjp/wgKuvc729cacAPgqve/v/FW5hJn
	v6Cab3wZvzG2+2C1HcN6oSOFa+vCKd38xsJTnIaUtM+GCaMOVt5OYoa4CHPbYbTNXSkdh52fG+z
	rjCNfoEUhy22hFRLzXipTZ7Hf96l/ihQuxqnDs7CNE5TTo5Vr2sr9VvKQY2rja4FXxQor/B7Iqn
	WLp1rluCRQwntu/d+KgtGuAQeNyngy1LtASBd6OU59XMJfYGOcvzUh2iAzQ7bYPvSsIW4pQcfU2
	EGFIyRMFqxeNBCbrrE7no7dhzae+csTYdgl43eS5fVfKSs1Zag300ggbmYm2z+4IHwjkgLSZlnN
	tITv2qH4cSU+tHoZYIGA7eM9BdlqF2b90i/cfLM+fFus69Lle2HvTpluxDLybLM2rhv3VZY00Nk
	K4wRm80oME48Pw00fh0CUejtNXHi1DYNz8LRqkp+ODILFS+A8+UqJZV1gy5A7u214YxrFkp+a70
	AZ8uRIM8Ypnqtkas/RWVHpBPvWMDrAKSPKmqcZ5IuIMXarH4nbjH78aW1OmwwdgQ8SGLndoTBpU
	5FLzuc3llbLdSJw+njsHJRST
X-Received: by 2002:a05:600c:4e8a:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a211ee9b8amr23155815e9.12.1792742512330;
        Fri, 23 Oct 2026 01:01:52 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21555f9e1sm10347795e9.4.2026.10.23.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:01:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:01:42 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	tabba@google.com
Subject: Re: [PATCH v2 4/4] KVM: arm64: pkvm: Avoid trapping on
 HVC_RESET_VECTORS
Message-ID: <atsUZv8-9is_i5r-@google.com>
References: <20261022140048.2522787-1-vdonnefort@google.com>
 <20261022140048.2522787-5-vdonnefort@google.com>
 <20261022173806.3752938-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022173806.3752938-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010154_966426_07B69514 
X-CRM114-Status: GOOD (  13.34  )
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

On Thu, Oct 22, 2026 at 06:38:06PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Thu, 22 Oct 2026 15:00:48 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > pKVM prevents the reset of the hypervisor vector and as a consequence,
> > kvm_hyp_initialized can never be reset. Add a fast-path for this case to
> > skip unnecessary HVCs on the CPU hotplug and PM path.
> 
> Could you drop this patch? It brings back a pKVM check in the host code,
> which Marc asked to avoid on v1 [1], to save one HVC that pKVM already
> rejects.
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/86jynbyshv.wl-maz@kernel.org/

Exactly why I kept this patch separated :) 

It is a single documented fast-path while the series removed 5. 

But I agree this is only for the CPU resume or going out of idle path so not
really a hot path.

-- 
Vincent

