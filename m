Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91C2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLzoHhwTaHnhjMBvx7XPbj3yAjurmamgiA97xqI13vA=; b=kV5OarmuamPs33mYqMAtrxY+L5
	pRCF+RXgkpQ86wGnsEexK71zYgQ1hAntCIp8MauTYCVtVacg/5JSYAOEpIJcEFMckHpF1J4Yps7Na
	iM8L6lfZDIGy1lZG48LkZiXeZ2UtXmaHMZST4hOHmIR05ASOTAz0umm2RvUO3JQNxY4qITP7m3L/E
	Do02Qlb6ctdmwNcU+9tyOCbCa1AmyJexH/8cjhoukScIrI+JUzTaqspQHX0yWUE9+/I2vKLi4jHYO
	HWRvmBR6dccueoWftfeTdRJ2x23Jwfu/uF5aTtobIKdsON/k+tztTK0ZfLPqm2AJCNJE7yQ2LlW/g
	38Nz3PMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97l4-00000006awn-2lWV;
	Tue, 22 Sep 2026 21:10:34 +0000
Received: from out-99.mta1.migadu.com ([2001:41d0:203:375::63] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97l2-00000006awL-227Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:10:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZLzoHhwTaHnhjMBvx7XPbj3yAjurmamgiA97xqI13vA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790111430; v=1; x=1790716230;
 b=JvyVaJajPn6oCPqwzZo0n1qYB2+2bfMifzQV2gk36kUt1/Jm6CaDQnEum2vHTxtUNoKbRg23
 2M28/6rOQzgXpuE30O480Bz9QmOk6oBsG+Nox6DQta4ONpt7JJLqcV9oWVk6NUu87ctvRggAVCc
 S/yjnAhWstFYltSrc00hzPsE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b90c56194a9dc0a4;
	Tue, 22 Sep 2026 21:10:14 +0000
X-Mizu-Trace-ID: b90c56194a9dc0a4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso797e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 14:10:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhNf8gRLvMXuexE1hukFqzODr7NAThH4ZayRfd9/hPdqYTFSj4uz8XuHyibeWkIDW71KHR4xFChbNkr1OFSrV5@lists.infradead.org
X-Gm-Message-State: AFuF++kktpW+V0H6T8Y+0KqT35D6h/YYO/te7mvhRat7fzLTUBkZpmSh
	n9zh08zYbEWSTo2CWOHpWOBjUJdPZqFX1xfEnJsCXqve+DZFmb+vCeMhjjYt2wNSsJVNFJgtDc4
	6VnREAhfhtYJE11WT6xNoFyjh9zaO7YY/OiZaOHBI
X-Received: by 2002:a05:6512:a84:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8d87fcb57mr47663e87.4.1790111413647; Tue, 22 Sep 2026
 14:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260922181430.3532371-1-fuad.tabba@linux.dev> <arLbbtuRuOrxlh1Y@kernel.org>
In-Reply-To: <arLbbtuRuOrxlh1Y@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 22 Sep 2026 22:09:37 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx8JsXfrjKUbhhrfSmFPrWxyYaTbKqMeYAJPt-vqGfLvA@mail.gmail.com>
X-Gm-Features: AclHuK98e37nffnaw1F9q5cHTfaeClpU9qBwO_qQHRPF451CnbaMSkO3wxXcRx0
Message-ID: <CA+EHjTx8JsXfrjKUbhhrfSmFPrWxyYaTbKqMeYAJPt-vqGfLvA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
To: Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Rob Herring <robh@kernel.org>, 
	James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_141032_674917_5CF5F611 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Oliver,

On Tue, 22 Sep 2026 20:47:58 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> We can trim 3 instructions from this by using the read-trap bits as the
> starting point for the write-trap bits, like below. It also makes clear
> the point that most of our trap bits are symmetrical for read and write.

I did consider that, and went the other way for two reasons.

The read side has three bits with no write-side counterpart
(nPMSSDATA, nSPMDEVAFF_EL1, nSPMID), so copying x0 into x2 writes ones
into three RES0 bits of HDFGWTR2_EL2. Harmless today, but it's this
bug in reverse: the first revision that defines one of those positions
in the write register turns the copy into a silent behaviour change.
Building each mask from its own register's names can't do that.

It also matches __init_el2_fgt, which already keeps x0 and x2 apart
for HDFGRTR_EL2 and HDFGWTR_EL2. And even in that form the copy would
have to sit just before the msr_s, after the SPE block, or
nPMSDSFR_EL1 only lands in x0.

Cheers,
/fuad

