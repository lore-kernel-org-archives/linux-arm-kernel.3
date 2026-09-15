Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF32C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4Pl5xwUE3ovNq6MEBbGKLwnmUG8A55ncNDQtXPQ1q4=; b=UFHM/46/U2QE8bJ7JW7K6gaDKg
	4Qu5EunWqZL5WoflackEfA1G6VcGPE7mB0L2FqLx1QFjMHv7OoPNV42JgGY8arIZKofRLtAF18SYY
	8XlPcF9lJEj8Kt6ucjZS2vDLzppafnaxeBs7JGvXA4wpa//PCOcpA2Qv6uRAxNPApV2sqBJ4yJe43
	/unk/gZnhN1Q+U82HRgoy3boOyLYj3yLp2Pt8y55Kat4CLaZRQ5VKKMVRKQVxHDojXDSPGk6PV6ub
	q+lirBaML1obh3AQN0O9f40a2A9qKe/j57Ztjw1kaWBryGakWepzJtACi2wskOGnNYzNJY/ezISz2
	bg7/ohEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Upd-000000077G3-24JJ;
	Tue, 15 Sep 2026 15:12:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Upb-000000077FR-16K9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C4Pl5xwUE3ovNq6MEBbGKLwnmUG8A55ncNDQtXPQ1q4=; b=pRHjVpo7P7r4+zix7bkR2kqjcd
	o5FTG36RjmRAcTCHt4h+w7HWhQFT3JsccBNXIsa1i2xgwzRhgrf7NyrJySJAygf48K7bfJhyS8t96
	ZzCkP/NbNMmM69SvnJu0lBP5Uu7eErOvfg5W+XzesS0NZZrnS85YMyUWMBkzxWrCLjyrI91xQwA8A
	qGpa5ueOQq64AvOKkiU72KuT7c98Y9+VeDPt4TYgtZt42NIr3mrrBz3L+LOxMZp3XxvSDpeAKi+JK
	tIq1EUCAKo6kAbUP5L9hZnciEBOnMSUKdlQDzwAWp2mFPEwsy8Z2eNiNiFERLpGsUBDocf8cCDRu1
	2xqCLb6w==;
Received: from out-132.mta0.migadu.com ([2001:41d0:1004:224b::84] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6UpY-00000006vIT-1sNK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:12:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3r4+AODjX+xG9QP/OqvGAgcLWtNZcO4KFLsZFVHz2bQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789485137; v=1; x=1790089937;
 b=e5LuxtnhllHUu1evO2w8jQ+AGvOL7IGSTu6ElFuI+ae672636TPv6TLer6+9u612MjARQiVN
 +aEjCZkBnpRSL57aF4OX4nB4lGk2FleoRSVX2Zd/Y8K1kQBUghRlG10aIJXQep0UImE1ioy16H1
 HdJQcBkXyNox+b19h3OSkgVo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5380f37123d3fbcd;
	Tue, 15 Sep 2026 15:12:17 +0000
X-Mizu-Trace-ID: 5380f37123d3fbcd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so1191e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydFmvzLkhAa26PqGKWxIdDubcbq1YAwyPrSSVs3VHHiMkS+/Mw2iEPc5HN9dakd8aq01yZISc0zDRpvTTn3bN5@lists.infradead.org
X-Gm-Message-State: AFuF++mHMc+CeXjOCkjx3sqev8Uem3hhY7eo+06dJDX2Es6F0b1ZaghO
	TKf96YVozMdjKXmoc4+ywMlyknEWV2lOgqS0a1K8ld4PW8FymVQbV7VmPI/5lsuPIgArjAgE6zx
	QROFWSsEa37B217alwMSgKk0+nB0encnx1AtYorlG
X-Received: by 2002:a05:6512:2390:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5b8b2d4e662mr188401e87.6.1789485132544; Tue, 15 Sep 2026
 08:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-9-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-9-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 16:11:36 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyezsXuFbw-eYUY8uPEd4bt7K=2K8HRg8tfHF2EA1O3uA@mail.gmail.com>
X-Gm-Features: AcwNN1XLaUwovCsrbP246c-_MGSA9ZbLdMWDwGYNe45yhrglwzVmarj2CpR2p1U
Message-ID: <CA+EHjTyezsXuFbw-eYUY8uPEd4bt7K=2K8HRg8tfHF2EA1O3uA@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] KVM: arm64: Restrict host access to the private
 ITS tables
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_161220_633853_86165F0B 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Seb,

The approach is right, and it has the same gap as the command queue in
06. A few things:

On Fri, Aug 07, 2026 at 04:43:17PM +0000, Sebastian Ene wrote:

[...]

> Make the original layer innaccessible to the host by donating the table memory from the host to

nit: "innaccessible"

[...]

> +static int pkvm_host_unmap_last_level(void *shadow, size_t num_pages, u32 psz)
[...]
> +                table_addr = table[i] & PHYS_MASK;
> +                ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT);

DIV_ROUND_UP(psz, PAGE_SIZE) would be safer here. psz >> PAGE_SHIFT is
zero when the ITS page size is below PAGE_SIZE, which
its_probe_baser_psz() can pick (a 4K-only ITS on a 16K or 64K kernel),
and then the L2 page is donated as zero pages and stays
host-accessible. Same in pkvm_host_map_last_level(). (Sashiko)

> +static int pkvm_share_shadow_table(void *shadow, u64 nr_pages)
> +{
> +        u64 i, ret, start_pfn = hyp_virt_to_pfn(shadow);

ret could be an int; it holds the errno from __pkvm_host_share_hyp()
and the function returns int.

> +static int pkvm_setup_its_shadow_baser(struct its_host_state *host_state)
> +{
[...]
> +                original_table = kern_hyp_va(host_state->tables[i].base);
> +                num_pages = (1 << host_state->tables[i].order);
> +
> +                ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(original_table), num_pages);

Could setup read GITS_BASER<n> and validate base and size against it?
base, order and the INDIRECT bit all come from the donated snapshot,
not the hardware, so as with the queue in 06 a compromised host
calling this hypercall can name a decoy table it owns: hyp protects
that one while the real table GITS_BASER<n> points at stays
host-writable, and the L1-pointer patching this restriction exists to
stop works on it. (Sashiko)

Cheers,
/fuad

