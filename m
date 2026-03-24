Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CB5E9A74F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=; b=UdI0uKbXqpTXYt+uV/UT90s11u
	j2PAKQUXb47VQcByxtXU2Nj5Qe9Omz88CGJDetSd27Ex/8m3edx+fQmiCIt/StHi3hHRygCYV+tAb
	HQo860YLoSlV6WNQb59dlbWDLVMu+wrBFEKVTXsExu8A7K81K1uRcPXJSU/Sx4Jvu53GYKOLdQQY8
	fkANYLf/zUlPk+hk37DoJ3pC89g+A5j0wHBkTX8H+kiL3WUl84J/8PDDyIjhW7f6YlezdWSSnuTAO
	85SULJW/i4B5838ziUffxvtW6dr/y5oHcp/YdQRdSNh7jLSTiWKfiF7XQ+NJei1gwBZy5ir7X+Kas
	NktM5KrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yDe-000000017AL-3VHj;
	Tue, 24 Mar 2026 09:38:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yDd-0000000179t-1UQU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 09:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=; b=WpojHjtpkfgtUoF43JV0VxkW5G
	dOCeHNf42fDnNgXG6A99l0Ko6kIoPwkzv1HZZSS7MWEYK2jGvFym5ivM5D6fEYXJ/TJg7ghk6UUTa
	xXrDYaiLPoqJiT+qpdrxlC8zUxLGAphJynb0t8+ChzgsSCLa7yS4nQ9HyHsbBCgkUNp3c9ADVjhqM
	rT3gXLbYMfp33jSFRjBu0svylb3C9k2ZiER24IPYKXeTV2ly/4RIAsXZwFOwhrRxVc3V+liQ2FfmB
	kOY6xeAweIBArknFCerGK7jfbvwsGVA919/SA5G2vCtD/xFMT++CnD1+EkgpWqGUSkycEf+lgwzOZ
	pwozQEsQ==;
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yDX-00000003fIu-32Vj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:38:33 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-79a3ba1653fso38467337b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 02:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774345108; cv=none;
        d=google.com; s=arc-20240605;
        b=LsMNJ8NXlxF6EjxFCXeEZytT1sztDAz/eTKjSx+Php3+H98xp3XO/DsL0bPd60fakA
         kPEk60GY3J5k6FrP+ZrWdsLGYPS3dgnj17icCZ7WUcjk0UEzuc7kAQjPCvvVPsU9pyPl
         48VwG2ic7sa/9AfJmutD6PQQK6N9BgIdPetXKZH/cvxSfzyRXn7mKiGw8B1eljPp37/w
         wrGqmkCSlpu060+Igcjj0zbU1/DPgr9cNn+zrBLT4TXyW2QHwP7hX8MKZwfT32RZ/XSu
         ozZ/0AWrLUo1lQ/KVS1Wc0Jt97Y7ycmkohz9BK+D1NdHdttFi1qCwbVC2UIVkkWFHY+p
         NG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
        fh=mAyuEDDfWkKocZPXgPfLPxNP0xTrKhxHUsXtRstYB6A=;
        b=NRp0BEY9hT97hKD/Dpt+FpD5Y8l7a25P7bNdxyzF5NF8tWdPeJ0p37y+BOjOplbIar
         Agjb6eWCA0ru2gQ2zQ1lDCYwQNjMOutCHFjnq3jLvLvLWiuFdrWiukZliKQc7YRc1XZL
         rnDwQBoiACvOBkqs/TbVUbMqOdPG9wCsrp91Vz/mOC1zP25BEkyHveVaPsbZfvrNpS2L
         AtlMLm5Op3jTmROMHwm79HwUEmrO7rKEXl/5IMLgKpJws2wM7zN/P8ULPev7RXTAY84B
         XS3REMHVGB5iGocfRCsLA1kGY6pTnpzCj65ldl25lZHH7jo5WNk3njiz3sm1X3ZU0LAP
         lzlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774345108; x=1774949908; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
        b=vzdtHp5yjzzaXtgphnrFNDShIhYimMZkVl2u6KBcd9cv/b/cdKqnZyGgc8ZtRziKkZ
         4hYx735OzIEjvDafh3duang3fCdr8+RUoKOI/c5W5hQZI5dE06oH2w3IEoFSEUf07tBf
         ZPnRjNh6NuZkdedcESJcjj7Kr5dnY9TjnOT/YcIytY+99L3vyUJuGrWA7gGUvFAApMbW
         wTWAbTJ5CfwU675RJ3ACaaJh2BP3EETmeZBPuT7u51wfCS5DyOUPY70lCOPwJIk9I55U
         F0Pf8FEyDbeL0pQFDgdd+DVpOH7k6owh23t6XIaXFEpjmaUnNQheHzWBR7qcDVvzXf/q
         ceuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345108; x=1774949908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
        b=GN0CjQBaA2PIKZ9zxa/gHKvxmQfCY0Yp2TSvF16WMUTLv318MPiA2bFL5q3QxkUNjF
         FFPUHUICmJZapSVHOkIk5/4BnBNQV0XuhYQfPWaZFAJbDKP4u+IrnbR/eKDT+APfRf2k
         OVe2lgktUqK9eiOWydrvP100Hszn9qaOyAF47ph/lUt8aEitOI8uCFbaTHBuqlznevX1
         KoQgzIlhz7yNBO2jjHVC6Tu4Rb+/Tao2DoZKLIPPYi7r1VJo7twe+I+f4xWSe/Qk1qn8
         WAOjRqsS7jef72qMPbEgi8c4lU9E+eqRREkG0j1ONQJS29ehHuvX5uFIgX0wasEuJ4Cx
         B0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCWPq/QTpHUCj1DIefZZvHgWH2eipeiq/aaOKCasrY8LQW+Q/qK9VHSImbo+AM7mkE+ruqexUzf7avLsuBdkNq@lists.infradead.org
X-Gm-Message-State: AOJu0YxYQOSgHzWfZAfDWzmI2VNig9NfCQnk8DLm9GIGrQwMDZ+g4nao
	sT4sd54V2K9r9DYPEasxFq6R15vg5CAvQMQ0neMnBCtSRq9AgWdxU7YFqexesia0Ql79uiRk5tl
	PM6LkjUwqvq9azh1O8PTCWOwUAnrSCrsCJOp5ZIjoIA==
X-Gm-Gg: ATEYQzxsvq2vzv0lG6b0r499te8r3bl5kBwJ2P+tQbSEZ0gmBoIj81vTfBUfOPDxT1L
	H4JfLfsrJK6mKPrlrXCFm69GmZ9Q30B2ukdfzQohbfYnAZaDFnH2iACIRVNJDBVom/1/suyyTC1
	6v1L9HiBSgenycNDKJtUTM803QrS7i929WoCIoIocDnj3K4WlUSHzC9Mgq5eZqYhD9rLD7LSEMj
	0eI73SMKBjnawJCfsEpq8DJ2YgRLmNoaZVmJ2uenTm3f1AOa7/J7jb2moglIba3aCwpnAmOLBdC
	0E2pDEPVdaNs+Jl7vypgrJh+6kBy7H0Tby7hloDV
X-Received: by 2002:a05:690c:7644:b0:798:83e4:277f with SMTP id
 00721157ae682-79a90b351ebmr138576757b3.27.1774345107831; Tue, 24 Mar 2026
 02:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260323194400.22886-1-rougueprince47@gmail.com>
In-Reply-To: <20260323194400.22886-1-rougueprince47@gmail.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Tue, 24 Mar 2026 17:38:16 +0800
X-Gm-Features: AaiRm51UGtrLd6_TOxXtMshZQx1vDpI_Zl-99r1LkNoHkpUs8Cc0m2THVB2Qi1k
Message-ID: <CABQgh9HV-DcChd1WLFAUGmZoVQ++Kekxr5gj7SU0zhqttqn_Jw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	xuwei5@hisilicon.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_093832_127548_F70A7EFE 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, 24 Mar 2026 at 03:44, Bhargav Joshi <rougueprince47@gmail.com> wrote:
>
> This series converts the Hisilicon dw-mshc text bindings to DT schema
> format and cleans up legacy node names in Hisilicon board files.
>
> While testing the new YAML schema, dtbs_check flagged the hi3660,
> hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node
> name prefix. resulting in warnings.
>
> Patch 1 Convert to DT schema
> Patch 2 updates the Hisilicon dtsi files to use standard 'mmc'
> node name.
>
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>

Thanks Bhargav

Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>

