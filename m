Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJBRZaSgchliWw4wWLkLEWuwp3nk6zi0pApkA4ydaQA=; b=f//x4Hak1RReuKRGqhc1fFoWpd
	Z/T3Jm0WMaS9XdyRlWuoKMGbsG3KnbS+haWp2z0X9Mi5iBpJNddw162pZImil5UdIkjubLZi8zYcD
	iWbDqyO6XuIMNY04mVEpUp6/3lP8npsOdS7sBAz28UYKWbxbSVJne6vecAgo2FCD9UbOzIYwNHmkx
	L3iOUh08Vl9BMj1G06Q/n4P34H4BZjbDHaSz0qDNO/cpufg8h+e+sbrcJwd5E8vmr38FFbchuDNbn
	B6nTQAZPg4lX5lnfgrfbGxtpDusnJG+IPwHiWgW5hsjUStaKq+ZtHId84KARTw/eP7n3JNeuf2wCC
	V1kk6eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YqZ-0000000AQLv-1O5u;
	Wed, 23 Apr 2025 12:04:59 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XrX-0000000AFdq-3OiP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 11:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745406071; x=1746010871; i=markus.elfring@web.de;
	bh=bJBRZaSgchliWw4wWLkLEWuwp3nk6zi0pApkA4ydaQA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ox8SHhMDynRZ4UWq5g+NDy3WLxAgbWwiPuGIaqRjAdTgEARXgKvENusKre6qfQlx
	 qIYRkjFbHC8jeWQ8gTOnyCaj65GQLj2KZ/2KI9qO3hNf/s6tG1PzygUsqN7OFX70g
	 dAReE3UrzgvWkWQukjV12AjX088iZ1rhv4qMLNqw7MUEcbj/JKmcpFD6lGhQ9ViTR
	 UrYYv9nTjx8hQU+X+oTBAzp8eYna21c4icmgUiPW4z/RJh9PqwPc7iiB8s+cbOKw3
	 CZEps0aLh8Bgx2KU1hea2cAPXrAae5vtI82IJGoPLyKhwJOZbd5x9OhyNqgq5TjjJ
	 ZO5rWeNK9WKkse9V2w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.6]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3V6E-1u86571ArC-00AzGR; Wed, 23
 Apr 2025 13:01:11 +0200
Message-ID: <a1be0efc-a4c9-461d-a01a-8fb830b2c68d@web.de>
Date: Wed, 23 Apr 2025 13:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH v3 2/6] coccinelle: misc: Add field_modify script
To: Luo Jie <quic_luoj@quicinc.com>, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Marc Zyngier <maz@kernel.org>,
 Nicolas Palix <nicolas.palix@imag.fr>, Oliver Upton
 <oliver.upton@linux.dev>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Suzuki Poulouse <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-2-6f7992aafcb7@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>,
 Lei Wei <quic_leiwei@quicinc.com>, Pavithra R <quic_pavir@quicinc.com>,
 Suruchi Agarwal <quic_suruchia@quicinc.com>, quic_linchen@quicinc.com
In-Reply-To: <20250417-field_modify-v3-2-6f7992aafcb7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xvSCXljCCknARbi0JItnFFXBwAmUxRh0fA0gwWeuOfRq7wj6wGN
 5xNQ4dFTKJ2Fik8upyc69y7miHX9kOfh+vGTMYy6HHyjPhT7DMe33NDvGjIXRDXV1+Lybhg
 xg/HO1UvOIMIsomFkLK5/x0PuSkg8yWK9747nUmSNjX+m2rb9sOTFxEfqbdXrdfKUBrSOP4
 EZopg77LmU3bOl4uwW6IQ==
UI-OutboundReport: notjunk:1;M01:P0:qNz1C3ar5JU=;rjaWDewSnTi3p/HCEWxAJ+B18ak
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_040156_231688_1357B58A 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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

> This script finds and suggests conversions of opencoded field
> modify patterns with the wrapper FIELD_MODIFY() API defined in
> include/linux/bitfield.h for better readability.

See also:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.15-rc3#n94


=E2=80=A6
> +++ b/scripts/coccinelle/misc/field_modify.cocci
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///

I suggest to omit a blank comment line here.


> +/// Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)

Replace?


=E2=80=A6
> +// Copyright (C) 2025 Qualcomm Innovation Center, Inc.

Copyright: ?


> +// URL: https://coccinelle.gitlabpages.inria.fr/website

I suggest to omit such information here.


=E2=80=A6
> +virtual patch

How do you think about to support additional operation modes?


=E2=80=A6
> +- reg &=3D ~mask;
> +- reg |=3D FIELD_PREP(mask, val);
> ++ FIELD_MODIFY(mask, &reg, val);

Would you like to integrate the following SmPL code variant?

-reg &=3D ~mask;
-reg |=3D FIELD_PREP
+       FIELD_MODIFY
                  (mask,
+                  &reg,
                   val
                  );


Regards,
Markus

