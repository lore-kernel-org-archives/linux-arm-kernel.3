Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BC7F3ED56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HknrgRw5K2uu9rlpW0SDG6Rrk5yte4UVCfui19l0FQ=; b=TNTy8Y2LvVcghE9aWAVTPtKjNH
	e42jnvo8P0NQnHn/lVndHSOaue8ZIIz/vpSAcsNREsIA/3awG2Eswsh3mF2VKTGCC0UZ5UzIaOyu8
	rCsi2uQD2v6GE4m7ityjno/jS87oEBal/1N7pTjTHAsAR/iVYrdDDXKWHs++UCvTe++ns9op9N6tW
	lkhuRGTCbOIvn6r6DiU/KVFRx7sXS8e5KTLDlAsR6Mp/sVzpRHL+tSgDY736qUD11WkmtgRchB2cM
	YPiVnDrcbugpnaKJozojytWdUJSoT+0EtckCDET76B4KPtt/CCwQ1FRc7TJeCTaRuAVhGOg/ZDMJl
	eXp7BYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZZ1-0000000DWfm-3UKu;
	Sat, 11 Apr 2026 14:43:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZYz-0000000DWfC-1MXc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC5564363C;
	Sat, 11 Apr 2026 14:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF06C4CEF7;
	Sat, 11 Apr 2026 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775918635;
	bh=tR0CGk7NejHiG1PUmXuw5oIHI38lBuPh+l/CGQhbhJs=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=EL/J3LhR9dyOXmqwHxsYPXMk0f6pauFrF252TuYfSSi2Ka2w1+FfkCn56TEX3Q14O
	 irX3T4/9hS2LlVSSRKjeRKLuZFx+n7sDXssdZg/oBcgPqa2oduk4IyfsQIeHWfoMgn
	 3DN9xNXNWJWisMqqqbJ42EnNeRRhCqeOM/Yuvo/UbgnMdUVeQgcXWU0jQIpgR0xtne
	 grdvy45v4BVqrx4+bfks/D00ng9kQuOsDo4RkwYZETFIceCzVr+CIlaSljqJMsJRTC
	 4GrqsWNjCH/ktjRlpkPKOjWmbzd/z/LGoK6XaIS7CYjKJB5m10oTSez5QYhDjTwBKH
	 nFbOtwuoRMmVg==
Content-Type: multipart/mixed; boundary="===============0546946895092955607=="
MIME-Version: 1.0
Message-Id: <a33924088b2be9bbc553442c810a63b94e23045fbcab9c2ff9788adbd9dc188d@mail.kernel.org>
In-Reply-To: <20260411133847.1042658-4-xukuohai@huaweicloud.com>
References: <20260411133847.1042658-4-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v13 3/5] bpf: Add helper to detect indirect jump targets
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sat, 11 Apr 2026 14:43:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_074357_406537_7BE1B189 
X-CRM114-Status: GOOD (  15.80  )
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

--===============0546946895092955607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index dd6dbd41b06d..dd8949874d1b 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> @@ -22544,6 +22551,17 @@ static void adjust_insn_aux_data(struct bpf_verifier_env *env,
>  		data[i].seen = old_seen;
>  		data[i].zext_dst = insn_has_def32(insn + i);
>  	}
> +
> +	/* The indirect_target flag of the original instruction was moved to the last of the
> +	 * new instructions by the above memmove and memset, but the indirect jump target is

This isn't a bug, but the BPF subsystem prefers the opening /* on its
own line for multi-line comments:

	/*
	 * The indirect_target flag of the original ...

> +	 * actually the first instruction, so move it back. This also matches with the behavior
> +	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to the first new
> +	 * instruction.
> +	 */
> +	if (data[off + cnt - 1].indirect_target) {
> +		data[off].indirect_target = 1;
> +		data[off + cnt - 1].indirect_target = 0;
> +	}
>  }


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24284268460
--===============0546946895092955607==--

