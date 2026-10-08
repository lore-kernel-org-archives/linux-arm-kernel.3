Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9B6CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKR83nbVxbLcyLekP2tauXtp08m1xfpMBejB0OmP9ZE=; b=vX6cwOizny22uruEplciB/C0OW
	jogLtGLMwVz6R651UOMKTv9C+PG8n+gb/CGK11Lijtxp4sfOzfsaSmlghmn1yEcteGPFoEMRCVgxK
	mScmyBd0Bv5MDRNAsJ2/5TXjGMbKZAR4HFDhfNPmBwjYMVk9WjKInJJ0EnO4m8myaRg1GXuyIbSOp
	0nkrGIHWBUCOZsz8pWg/tQuHS4Mc4ggrNA4vkvoQnYZz+3WdcDtXkeo/t4wkJzzTa/lcv/CusMcw0
	qt0s2Abgj5dwTGMFaq4GCCnhZRtYLuVhG3AvH7fJXcBdwuxuvXu504fiOzEErd30/Td2CkGHQX3ub
	umVmO0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtZD-00000004uKV-2E1K;
	Thu, 08 Oct 2026 19:14:11 +0000
Received: from out-90.mta1.migadu.com ([2001:41d0:203:375::5a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtZA-00000004uK9-3F0S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:14:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AKR83nbVxbLcyLekP2tauXtp08m1xfpMBejB0OmP9ZE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791486846; v=1; x=1792091646;
 b=GRuT9PyjtrKV24zT1m7nKq1byVdCATSTjL+r8gnAdQwNlBYb78zys/K7PHd5x32e/sdefucx
 A/dHh/DV8ctGiZ9kImFkQA/6OFLjcuL7jbpGNDi4D+1no3udWAYAULtg3I311ASVoBFWJlMvksH
 xqvgvaNcZOw6VqMT3HBgUO+A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b63013d92726b200;
	Thu, 08 Oct 2026 19:14:06 +0000
X-Mizu-Trace-ID: b63013d92726b200
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba40832934so221e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPbRWl4Cojlcovoth9Z00MuBoRbpr8w5E5xtg5FbwrLWqkVhZfN2FD1TSxJCO+nyco7nFZKBWVldPEhqI8N1YG@lists.infradead.org
X-Gm-Message-State: AFq9FYKdAJhlHEcLtFyEM8QInldFpk+HMI7cpmjahlIZwIYodxrdFMK0
	ars4akq8Rhqtoz3kj8i2qOySUvyRNP3Y1+lkeaDuRJ3w392DDngE5uSpolYy9tnJLWj4B48N15S
	zX1QZnyntTwCoX8WNnoDBnb68+rAsYbkEcoEcIObK
X-Received: by 2002:a05:6512:10c1:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5bcdd4f70eemr5332e87.10.1791486845553; Thu, 08 Oct 2026
 12:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261008104212.3134550-1-vdonnefort@google.com> <20261008104212.3134550-3-vdonnefort@google.com>
In-Reply-To: <20261008104212.3134550-3-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 20:13:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzpKk3hUTriyRF-YWkNQpQ82vuJoqKkW+uo+6n5f2mhmg@mail.gmail.com>
X-Gm-Features: AclHuK_ThQjFI6b4HwbVAIZDiFDSYYuCsea3IqDte6EDuPAwAowo5mbSypT5SSs
Message-ID: <CA+EHjTzpKk3hUTriyRF-YWkNQpQ82vuJoqKkW+uo+6n5f2mhmg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] KVM: arm64: Fix bpages backing allocation size in hyp_trace
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121409_055722_A8BBD0D6 
X-CRM114-Status: GOOD (  10.13  )
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

On Thu, 8 Oct 2026 at 11:42, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> hyp_trace_buffer_alloc_bpages_backing() computes nr_bpages as
> (PAGE_ALIGN(size) / PAGE_SIZE) + 1, whereas trace_remote_alloc_buffer()
> takes into account the buffer page header.
>
> Align the bpages backing allocation by using
> __calc_nr_pages_ring_buffer_desc(). There's no need to validate
> nr_bpages again, it has been before with trace_buffer_desc_size().
>
> Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")

Should this have Cc: stable too, like patch 1? The undercount is there
since 3aed038aac8d for small buffers, and 442ffa742daa6
("tracing/remotes: Account for ring buffer page header in size
calculation") makes it reachable at ordinary sizes.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

