Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A664CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hz/21B5ufCfS1Pa8Mq/xh1ZJSPjlznnSBfcrCWTlvk=; b=b2/aAyHBlO7tmBidTS/UHinH8C
	l6ibDZk2FAgT8nPpLHLFOP+rYjVSq+iiAWHoSQiJXAERT6lCsnLZFuV4dw3W+hPrcM3Ln+Kc5aSA7
	m9/dg2MvrCHCozZa68Psj+VQgtMbjQMVHi5+EE3xF6vUzrm6HvFKPAmCs78jCUv6cl2zttnyqTIJd
	ss1H5xA5frjPlF7ponV8SZVGn8x/fvhDBZgv19ZK4RhtAA1ezSD7bgPIPBCUD7bqa90AptkBxTrlT
	OjaY4GbL24Ox3rPgjdOhKJdVA+FOb/Fb3OHSnVDAS5q9gOfxd7ALOGG/8Dr0ke1NRg2vqPGKEZimo
	WjGMkAfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtbD-0000000Eml6-0ehl;
	Wed, 14 Oct 2026 07:40:31 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtb9-0000000Emk6-1BRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791963627; x=1823499627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8DNqwTDkyG/HzDA3Nlvx/HSSupKQoyoupiHktAu3TRQ=;
  b=qD5Kr9KBXZCc6ZwacsoPl07q7rhsTov7KYoPKtFlLU13wAFA4XhGb30m
   xSwRVZDYN1xkIgOw48v3fIDFlWCLLgdWwRE0mE+wxDK1qGOZ+EzRBPwQ+
   k86xJeMkeqM3PJHE55AhXeDkUDl0HVspPafduhSoEk085GVCgdXU1i1lp
   WwGZtSY4n9jdMnvMsHCsD8nbozrjidpWTGqDWp/ExQyvPQeq8zTFQQY3H
   RXV0C1RuNaYRZXBRqaC/6VHaPmms4ZQT7pF2cVTuUBpu9m84egFJ/8Tg2
   OZdS1lajopYcy+IVWSfKMJubBi/xvqZMNEIkUF05uNO1BpSCDFXRkb7Gk
   Q==;
X-CSE-ConnectionGUID: KbNMEXChS+K8Lg3Mj+SP1Q==
X-CSE-MsgGUID: lwVUfptUS7KHk5DMGQimAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="258155188"
X-IronPort-AV: E=Sophos;i="6.27,157,1786978800"; 
   d="scan'208";a="258155188"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 16:40:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BC6D61C000D8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:40:23 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6C2C518026D4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:40:23 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 66FEA402666;
	Wed, 14 Oct 2026 07:40:18 +0000 (UTC)
Date: Wed, 14 Oct 2026 16:40:15 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v8 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Message-ID: <as8x38o9taXgKZym@sm-arm-grace07>
References: <20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929-kvm-arm64-set-id-regs-aarch64-v8-0-58aabe2c2fac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_004028_014265_70499FE1 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Mark,
On Tue, Sep 29, 2026 at 05:16:51PM +0100, Mark Brown wrote:
> While debugging issues related to aarch64 only systems I ran into
> speedbumps due to the lack of detail in the results reported when the
> guest register read and reset value preservation tests were run, they
> generated an immediately fatal assert without indicating which register
> was being tested. Update these tests to non-fatally report a standard
> kselftest result per register, making it much easier to see what the
> problem being reported is.
> 
> A similar issue exists with the validation of the individual bitfields
> in registers due to the use of immediately fatal asserts. Update those
> asserts to be standard kselftest reports.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v8:
> - Convert another assert.
> - Link to v7: https://patch.msgid.link/20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org
> 
> Changes in v7:
> - Rebase onto v7.3-rc1.
> - Link to v6: https://patch.msgid.link/20260719-kvm-arm64-set-id-regs-aarch64-v6-0-724287f5f108@kernel.org
> 
> Changes in v6:
> - Rebase onto v7.2-rc3.
> - Drop changes to handling of aarch32 related registers on 64 bit only
>   systems, an in kernel solution is preferred for those.

I’ve reproduced the set_id_regs failure under QEMU with kvm-arm.mode=nested on 
a host that supports AArch32. KVM advertises the NV-capable L1 vCPU as AArch64-only, 
but aa32_id_visibility() still permits the inner KVM to expose ID_DFR0_EL1.CopDbg = 0xa 
to the selftest vCPU. The test expects zero because it skips setting expected 
values for AArch32 ID registers.

In v6 you mentioned preferring an in-kernel solution. What did you have in mind, 
given that changing the value returned by GET_ONE_REG may affect the userspace ABI?

Thanks,
Itaru.

> - Use a define to count the non-test_regs registers.
> - Link to v5: https://patch.msgid.link/20260317-kvm-arm64-set-id-regs-aarch64-v5-0-a60f2b956e22@kernel.org
> 
> Changes in v5:
> - Rebase onto v7.0-rc1.
> - Link to v4: https://patch.msgid.link/20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org
> 
> Changes in v4:
> - Correct check for 32 bit ID registers.
> - Link to v3: https://patch.msgid.link/20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org
> 
> Changes in v3:
> - Rebase onto v6.19-rc1.
> - Link to v2: https://patch.msgid.link/20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org
> 
> Changes in v2:
> - Add a fix for spurious failures with 64 bit only guests.
> - Link to v1: https://patch.msgid.link/20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org
> 
> ---
> Mark Brown (3):
>       KVM: selftests: arm64: Report set_id_reg reads of test registers as tests
>       KVM: selftests: arm64: Report register reset tests individually
>       KVM: selftests: arm64: Make set_id_regs bitfield validity checks non-fatal
> 
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 130 ++++++++++++++++++------
>  1 file changed, 98 insertions(+), 32 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

