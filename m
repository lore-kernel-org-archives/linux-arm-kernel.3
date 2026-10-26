Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A104606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b74fyP9Z;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=LPPQnzvK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dTb7AdHY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BrEL1yZYpIcLAzHAsc2Z+gooj+CaoTSi8SiGe8AGnNY=; b=b74fyP9Zn4VqBA
	/o7JWDo7puAYKEmntqLtoEnIUkid+7Zpf7s7Ze7Kun/RfRaW6Nf7l7kJ4KS3mUpFY8weOfAsT1I25
	4NosjwxocWhrVsiMNkv48LvtsQjLcMOFnERVTOWYDUGsc84FIuJjq4BhFrHbTm6oD0yYwyACAOn6T
	ZtWEV6pv8u5qoSO+ddWuHc5Bs14/n0RqpuryDtLQx9gkcGhNvCbt7QMjBNMI1uMXYnk/za2gGPafK
	gyPsR1JrfKlEYXkDhNlV5zQ+hzb0+luc0BHKEv7I0C39d4ZsI9Z9o2xhxsI1rWUNeDrCv7eGglquL
	gUvd9ze3wislDnHq+r9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOZc-0000000307K-0wTD;
	Mon, 26 Oct 2026 17:33:28 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLOZZ-0000000306t-1eIm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 17:33:26 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id C5CB3EC0AA3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:33:23 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 26 Oct 2026 13:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793035996;
	 x=1793122396; bh=BrEL1yZYpIcLAzHAsc2Z+gooj+CaoTSi8SiGe8AGnNY=; b=
	LPPQnzvK+SbfoIih53v8f7y30iomOt2k8Ona9dhrLqDJ7QMDrjGz+ypGdQrgxN+5
	32YhuZaj/uxVHmJhzOBU960f7XjNgdyd/WbJJgrFzA00QjauB2IiIWKbBj/zsweW
	stVf9VlhggCahTm2QGgocMae//6HG+aY2IdNbi/RjtSPpbTeYosqCQvt33pnsvGw
	y1elcktCk4jYoMduDvgIPcJ+Enbu59S9KYeOv0Ec7GGcIin+XctzrDhscdQNTIHt
	fm+QNESusNfEH8oM3vYQxnhNT+zfythfJ6sQZikB1Pmsp08OpSduMB/BYd6Q6mzj
	s1cvR/y0H4AwdM2D0k5rPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793035996; x=
	1793122396; bh=BrEL1yZYpIcLAzHAsc2Z+gooj+CaoTSi8SiGe8AGnNY=; b=d
	Tb7AdHYA9xuH7bpYYJmXI5xjExbHTJ5GYwjlNkIlSoXpMWGJgJ0NUlnoNxigfD59
	tJjOPUbiek97zMjnWIj6xj6vdkvbmbI6+4kgPEFH8edcO8XW04HKocZY8+hYH/4R
	DvLRzhqxnMeN10pstFp6Es0whRP1GaMpM+2RVeQdcLike2HUdlK3f1Y+gaPjIefh
	65i0nfDnOo/jGss2KIOPU7aBCnyOuVqLUqKJQRiwRIGmcOuj+iFmmLv6zvMSpFTB
	qB7YV8KAP0x4RS/1uGCB4eZVcc1OwmdhMdvBwtzVUd3CKh26mlyfYcLqJqxDPo2s
	FKF7S1d4dUbvdl/YCoIBg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793035996; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:bg2V14QYaQF7rljlK/gwxsBZlEpZUwaEF5oWCAJ0yRSZrSY
	iKvnswyrwu6lTCM1skVtd6l7CDDXlRmfjp6Jg80XhGyovKG02BUwa6vq0z2iCObt
	QKul7RzaoAEfGfa43QnEkKIbYmbt/KcQUgHXHtKq9Hp//yjZO9AWfGlHyfKl9mio
	qiMooiTwpb2afyqgql/T+Oxq3qHapU0F6MSFl0u9133yBPgCBTHnlRwQiYuZ4cc0
	0OmRzHPLQK749Fk2kzI2CgGBgnhiCVcygqWPB35oXyjDpspcovtt8EUTbFT1PLkE
	HBucXyqVHPcGghOGl9zyK9uE5gewQB4XuHyxjLg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nuP/XYnK8k++am6mOyTBSaP16sX+nffcxYhrlvU22Is=:+RgG//+JJS0R3Sii2WKnGvIJg9YfR5JsuiisEYNP0G8=;
X-ME-Sender: <xms:1o7fapdbi5D_OSjkA78u6NEKwFbC2_ijHXP41WJAsWWbkuQHMAbyiw>
    <xme:1o7faiB9YvyA5FcET4mI8qaK55gKkplosjXaANuXxL2IN4lvUxiPhiYfmyqtxMghg
    xkb1AZ1CP0rviSmq2ZAzma8IDoRrYXSfFwhBjJkIR4LrLOF0ribIg>
X-ME-Proxy-Cause: dmFkZTEUuuijA2lITnyDOlv6F4rCoz9elyg7FAVVW22fRBFyD8X1akgZLQbCt8FQNtWoev
    UWBdZ9wARR4AXT3sACjCuGKxrD1Dn3tymdVnvkVKwRI+R7DW7khN2LpJOLJCH9TI74vsqH
    Br96OM20HT0yHdvdmJK97Uh+QWVlFRmW/RLRb7xTAuyffzSv4bIOWUxDh+Hq51dzxhMBxK
    7KfJNAiEZvP0UhpvlIz6XOcGyC0BcL0381v2C7Y7Q0Qzyj1ZA2XISjR4l6gYVKoN7B47/O
    ayjgStE8UV8JErOO9ZuPLGgL0Q1+rFUu5FUq/3IcExo4q6qv8wpljRRDrEtlruxYb3iiE5
    xDRgWsbLVAflTIBSJC5EohgVRIqHtQSO1FhY4SqL51YbXExkfXSOPbBa234flL3RRvbRJY
    8FabQvqD9p6/PiP2Jpli3pwS40sMGJ2uRuUlpXW1JOh5EIGFRq7T1jVOYbfRsTJQdlJcao
    BBvx9qOCNLCDSwym/RJei2TRd5KZnjXb0CzQNiSU5hUZSsHHeqEHIBoNaOpN//p4Ug04cC
    89IoLl9S4c4zuqFp/rcdaLsmVB0MC0Hs3tdTJI5QtISxRMpn6KrBMxnwg3kkx2W9IgehMR
    sYQeP4E4X1druqWKUVq0qpcLQIZ3UKEW2/Se8O0UNSfBLXj0nunedPKE7aKQ
X-ME-Proxy: <xmx:2Y7fakVoIDc1LbkN99p_BDg4zeB_Ha6lOaLhScOE-raa34zFZvDygg>
    <xmx:2Y7fajQ8vK6EXnvGqwYtD1PSuA58bKmoka0dWgqrsLxg1qcJeDHcIQ>
    <xmx:2Y7favAM7CijC3KkP8SfDD2aKBS_sWPKXsM5PJSibC5ax74ehiqgIg>
    <xmx:2Y7fauS9iSq221n_QOxNwlDa_H83M1xDY9qMeioKEJwSD7T4Ti9akg>
    <xmx:3I7famXPASOO8X7RSGzpLjSsZ2SEmpe19AkfBFYuj8BHEeX2zmP4Zetc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 613AC32A0099; Mon, 26 Oct 2026 13:33:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5YN6CdS_DiJ
Date: Mon, 26 Oct 2026 18:32:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fuad Tabba" <fuad.tabba@linux.dev>, "Marc Zyngier" <maz@kernel.org>,
 "Oliver Upton" <oupton@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, "Steffen Eiden" <seiden@linux.ibm.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Yicong Yang" <yangyicong@hisilicon.com>,
 "Zhou Wang" <wangzhou1@hisilicon.com>, "Fuad Tabba" <tabba@google.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <4066f726-310c-4168-bc06-1502740703db@app.fastmail.com>
In-Reply-To: <20261025075138.2919734-4-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_103325_770246_FF193648 
X-CRM114-Status: GOOD (  11.38  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026, at 08:51, Fuad Tabba wrote:
>  	return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
> 
> +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu;
> +
> +	/* The host never uses ACCDATA_EL1 */
> +	if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) || 
> !ctxt_is_guest(ctxt))
> +		return false;

Maybe add a wrapper for this as we have for other features?

In my patch I've converted the check to use this one now:

--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -909,6 +909,11 @@ static inline bool system_supports_bbml3(void)
        return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_ls64_accdata(void)
+{
+       return cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);

which makes sense to add in your patch first.

I think we'll also want a HWCAP3_LS64_ACCDATA exported to
userspace, but we can keep that separate.

       Arnd

