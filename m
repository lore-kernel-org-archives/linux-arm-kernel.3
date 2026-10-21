Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1B6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZOt4efIV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KB64cRVr;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hV6RjXZe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=; b=ZOt4efIVmawYeV10wLpj1SVnTf
	B32rEmt5mp0SL/QkdK1Rd9Ezc/kbthUB1OLpTP4xTSIM8hapfSe5xq6Yhu8qj+DjnjSVhTnCODGHW
	jT7HNOLxGkO6erbj0ocPnRIkixeDGhuzpseLJ5jAzYvr95LJju2C444bHDphGqLN2HowX53sA09tx
	zW+ZsTJqKGprZxwxwGTBq2orxM4atm4hlYhyaAt4365mzpinAgRZdXZts8cFR0FduqUyXM20WylAb
	RbZfK6JldL0bAvRuk7lNDYie7yZzpacryPH4mmW4NcKde65xTzPlvs1akm5eG8vHL3oLIJu0xNVP/
	X9YZHRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWd1-0000000BxfT-3xsH;
	Wed, 21 Oct 2026 13:45:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWd0-0000000BxZc-0IGz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 13:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=; b=KB64cRVrMxAUrBQRrKkp2psJUF
	h6ikXxPR/06b4tPxrBaRfSJSoco5HjHg5KEKTNY5LnO5kRG7K0UXPZJNucvJ6P5hgnUEatkx1EM1t
	yRoVZydEsutz4/qMw+dVj2iqA3VGiVnymeCQJuFT1m6Rxz7DueCoB2b7yCDXUQna3xHKpAhPTQis6
	05dFiXrGqzA6Q31ZjBbJMasOAtn/4T/Re9lAaiIDGt2ba7ZzF1Mz3a0FpEVga+kPVGqthnqnykpw/
	V28OFq6zCQSvjcKjJ1E4YFr4e0HVhafTTBYVnmNqk/9q65N461JNsmZZu6PLKweuW7Kq4WJI1WeNe
	XF9JWnNw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJWcx-00000005rTx-1ScF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:45:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so9580a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792590308; x=1793195108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=;
        b=hV6RjXZeCqS1tgndgfIAemUXDMEmK91T14+aQgvTnXu+L5U4+CrFZ2MTsquH4TOMgY
         XwO9MnIr8Kkca2xjj/BFUWRdjeY/1OXHWklMi/4F0yyHlhdHmKhdAMUDXHCsDnjB3hl/
         1CmMT27vF7VlEtB8sADr6iwfuITKbWhigJajUplpaYspYPNYtovDrNQElUYsI7fvnFF8
         kv5jaE5vS2+knGEwKBJhkZMlmQfgjNRhxWdBUy80o+32DJq1ozA097EpO9YiE+oqOoY4
         x/ScaWm6sESGlrvFAu75brY5TTYZSjP/QLJCCWQLMGH98mbl0QMQYuKIpQ2erIbR0oTv
         /Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590308; x=1793195108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14kePxaJgvrh0ObJmhms1Rosb4Wt+rKX1sH/AFcKt3s=;
        b=v+S80mLM8OdSPW8OQ+VEQNnbGM9inQsnKzaqIUqZdmnRLIBjk268w9rvn2b1DQWZMi
         6O2vmmq5l9AGFq2V36Wdd6ffocq02FoskBv8ludL6kqSTYXsiwwvO7sH8ZdYYZhJZrxN
         A11y6KSQsmRtd51/0/c9tnBYL39nHX4vSlCYsHhSi9DooUXY36tdINQOfDkMcJKGrZxe
         OMtEE67id/IAWNTZjvp/hGiem8tJSBglUkngDjCTZHWF0IfPdXmvC3JsgLXPP7L44cug
         /GR3yZh+KTtY+RoYn6rDPSafvcwXI4b978V6T7ntwF8UlodTaCD72RYdGlfVNtbAZbWw
         1Pjw==
X-Forwarded-Encrypted: i=1; AKwUvBxSFNSwIbqqdpPna0Lv7vQsjVdlTjBMtjQoRemFPZ+BgMjOJ5CvJxJQYhgGVkFPfqvajBIvuM5E0hgov0ivi5t8@lists.infradead.org
X-Gm-Message-State: AFq9FYJgth3rGPpqBjXW7XNmFrpC5IlqPLFBUnRyF0NESZHwXyNpQ47B
	zrxfNTurKLwtQMHLYRbkF9l+pTYBGkNuEo56c0WiM06WmDuWgjVyhWPpguZDgKH1yA==
X-Gm-Gg: AYBFou294hOPvxcEeSq7uO/lh+ZePOepH3zGsXlViplRe4hq0m9aZx9J+txttXnTUkr
	DgOhDOY+ab65XlHXmeTNSwywdcSzA09v67dzn1tA/xCTP83yVfcn/666cCaF1qhRlF4bbNIA/H2
	e7GhCnWCHKlvC5aDXGty3vqh6J7y2kXpmn854n1EVwgYE3iSodDTOVPVsMKCpjov86nhS4+y3f5
	JUe7HSCU2Ww6VkOvVLoAysnW/hm85kMN5N6l/gnJRqa+fad3rMvWbxnCF6BmZIVBNn7MaYWnSLk
	w5J1SP4740dyjEiMpJm29jDFSPrPymeELKnUPs7MVTzNi23WST1qezZrs40iy0tsIew9RKilBpA
	ir3QbB7nYkGPyxF4fWzrfg76cXSllx2aB4EK3xa+Wmu1rIHahaXXPLspagCYKNoGEmSkYyn2aXN
	6ve7GlbmXwDmpm4xSM9/HKeFdcrznFG/2XUgOEWRxl1Eq+pBhKbZjJKOfll8G5msI5zEU9ZlzAB
	iqCJimK1bf0iKNZVWv45nLB0wqxofSxhx3ubVGF75oHjU3mlHD+n9pdRgoApluRE/+lCW/k4XtW
	jBYPkU9EJuWkt9ZNlCzBJuREU+9moTLs286jOX8+TXQ=
X-Received: by 2002:aa7:cf8c:0:b0:6b1:d80d:396b with SMTP id 4fb4d7f45d1cf-6b3e9c11a49mr111990a12.14.1792590307609;
        Wed, 21 Oct 2026 06:45:07 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61b2aasm5475966b.86.2026.10.21.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:45:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:45:03 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <atjB34tvJySp9abz@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
 <atdSrRwrphdI9ZQA@google.com>
 <atemgT/67JPpdk57@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atemgT/67JPpdk57@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_144511_479850_8DD4379D 
X-CRM114-Status: GOOD (  49.46  )
X-Spam-Score: -15.7 (---------------)
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

On Tue, Oct 20, 2026 at 10:36:01AM -0700, Nicolin Chen wrote:
> On Tue, Oct 20, 2026 at 11:38:21AM +0000, Mostafa Saleh wrote:
> > On Mon, Oct 05, 2026 at 12:30:49PM -0700, Nicolin Chen wrote:
> > > +	/*
> > > +	 * According to spec (6.3.24), HW aligns the base down to the table size
> > > +	 * and ignores the low bits, so an unaligned base would make this kernel
> > > +	 * read a different table.
> > > +	 */
> > > +	if (!IS_ALIGNED(base, size)) {
> > > +		dev_err(smmu->dev, "unaligned stream table base %pa\n", &base);
> > 
> > I understand these are best effort, but what happens if the address
> > corrupted and happens to be aligned?
> 
> This is a basic sanity so HW wouldn't immediately fail. A corrupted
> address would be trickier to test out; also we don't have a perfect
> way to do that. Earlier versions had some address range check. I've
> dropped it, following Jason's comments.
> 
> This is also in the kdocs of the whole smmu kdump functions:
> 
>  *  - Only a coherent SMMU (ARM_SMMU_FEAT_COHERENCY) is supported, as the stream
>  *    table adoption is done by memremap with MEMREMAP_WB, which is verified on
>  *    the real hardware. Callers of these functions are responsible for gating
>  *    ARM_SMMU_FEAT_COHERENCY once during the probe.
>  */
> 
> > > +int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
> > > +					    u32 sid, phys_addr_t base, u32 span,
> > > +					    struct arm_smmu_strtab_l2 **l2table)
> > > +{
> > > +	struct arm_smmu_strtab_l2 *table;
> > > +	size_t size;
> > > +
> > > +	/*
> > > +	 * Retest the span in case the L1 descriptor has been overwritten since
> > > +	 * the adopt. Reject this master's insert; panic or SMMU-disable would
> > > +	 * either lose the vmcore or cascade aborts. Do not try to fix it, as it
> > > +	 * would break all other SIDs in the same bus (PCI case). The corruption
> > > +	 * blast radius is already bounded to that bus range.
> > > +	 */
> > > +	if (span != STRTAB_SPLIT + 1) {
> > > +		dev_err(smmu->dev,
> > > +			"L1[%u] span %u changed since adopt (was %u)\n",
> > > +			arm_smmu_strtab_l1_idx(sid), span, STRTAB_SPLIT + 1);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	size = (1UL << (span - 1)) * sizeof(struct arm_smmu_ste);
> > > +
> > > +	/* Same live-corruption check as the span; reject an overwritten base */
> > > +	if (!base || !IS_ALIGNED(base, size)) {
> > > +		dev_err(smmu->dev, "L1[%u] bad l2 table base %pa\n",
> > > +			arm_smmu_strtab_l1_idx(sid), &base);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > 
> > Those are a bit similar to arm_smmu_kexec_parse_strtab_2lvl() is it
> > possible to have some helpers instead?
> 
> Sure. I can do that.
> 
> > > +int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> > > +{
> > > +	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
> > > +	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
> > > +	bool was_2lvl = smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB;
> > > +	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
> > > +	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
> > > +	int ret;
> > > +
> > > +	dev_dbg(smmu->dev, "adopting crashed kernel's stream table\n");
> > > +
> > > +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> > > +		/*
> > > +		 * Both kernels run on the same hardware, so it's impossible for
> > > +		 * kdump kernel to see the support for linear stream table only.
> > > +		 */
> > 
> > STRTAB_SPLIT which influences ARM_SMMU_FEAT_2_LVL_STRTAB is a SW choice, so it is
> 
> I missed that.
> 
> > possible to get such mismatch if STRTAB_SPLIT of the newer kernel is larger than the
> > older kernel.
> > However, I agree that in that case it's better to refuse the adoption.
> >
> > > +		if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
> > > +			ret = -EINVAL;
> 
> I can replace the FEAT guard here with
> 
> 	if (WARN_ON(FIELD_GET(IDR0_ST_LVL, idr0) != IDR0_ST_LVL_2LVL))
> 		ret = -EINVAL;
> 

That makes more sense with the comment about for structural validation,
although.

> > > +		else
> > > +			ret = arm_smmu_kdump_adopt_strtab_2lvl(smmu, cfg_reg,
> > > +							       base);
> > > +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> > > +		/*
> > > +		 * The kdump kernel need not match the crashed kernel. An older
> > > +		 * crashed kernel that predates two-level stream table support
> > > +		 * may have used a linear table on 2-level-capable hardware, so
> > > +		 * enforce the same format here to match the adopted table.
> > > +		 */
> > > +		ret = arm_smmu_kdump_adopt_strtab_linear(smmu, cfg_reg, base);
> > > +		if (!ret)
> > > +			smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> > 
> > For simplicity, it is better to enforce the same table formats between
> > kernels as the rest of the file, for example,
> > arm_smmu_kexec_parse_strtab_2lvl() refuses different STRTAB_SPLIT.
> > Some checks can be removed and the was_2lvl error path. It's
> > very unlikely to hit such case anyway.
> 
> Sashiko pointed out a corner case that a modified kernel kdumps
> into a vanilla kernel. It is not really a big effort to support
> it. So, I would rather keep this.

I see, I have no strong opinion, but I think we can just ignore sashiko
here, and this can be a limitation as long as it fails gracefully, it
makes the patch slightly easier to reason about.

> 
> > > +	} else {
> > > +		dev_err(smmu->dev, "invalid STRTAB format %u\n", fmt);
> > > +		ret = -EINVAL;
> > > +	}
> > > +
> > > +	if (ret) {
> > > +		arm_smmu_kdump_adopt_cleanup(smmu);
> > 
> > Probably easier to inline the error handling after each call and remove this?
> 
> I don't quite follow this. The clean function is used by three
> sites. How can we remove it?

I see, I missed it is also used in devm_add_action_or_reset()

Thanks,
Mostafa

> 
> Thanks
> Nicolin
> 

