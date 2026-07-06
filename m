Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzXpYPV0PFB6TX9ZDcqY7ctXsxYzZyik5uIt1kgj5dk=; b=AXgvj4ZhNYoATXgj6d5czWaQfJ
	CV8kpo7NbA2Te/z0NCmaQ9Di/rxE6PySa/8+McB7iWpbvsTWJJI9LSGxhcqUeFgHezRmZmni6crHw
	qPjlg4zJ+DIz1CDSvUPQoaEZm0izjRuFyB/ZjojDkwZpNO3C0VQ9ucwBwTx02OowKHvHzGxIHpdvB
	RBg10e4VknivnlafgovNF+D1PF9wQ4d7WKEIlF2VUxboKgSAmgakYDRpWAPzYi3+Dq3G6fj2NmX+K
	VhyOwmeM37i+pl2N+2Fv1kSrHEt27LK5VB36F0ZtwZKS1IBPTkpkcjWRh485ggCCblmri8BQ9aeY+
	+LwY1UKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfF2-0000000Bxhq-077Z;
	Mon, 06 Jul 2026 09:03:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfEy-0000000BxgO-0lbk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:03:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97C4BC8EC67;
	Mon,  6 Jul 2026 09:03:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6142F601A2;
	Mon,  6 Jul 2026 09:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91CB311BB9D70;
	Mon,  6 Jul 2026 11:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783328624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EzXpYPV0PFB6TX9ZDcqY7ctXsxYzZyik5uIt1kgj5dk=;
	b=WIuz54puOIXvKsy0eg8hrSFIjyHK/usc7xVOrM0SNdZJgw12G3lKlHqewYnbWQemzWZMkt
	/II90sH6P0vbNirv6FCXYhRej6fzQU8Fc/UkcuengFjODFKvrQQZxobS8ssaQuzaKQ4zXa
	JMxB0yGF8nyVXi5OBQS4EZUXkUIcuMfrMp08oeRMPF73D4WLEo+HBEinnD+Gq4Qf2szNi+
	kR3dCEPtfXTAeXiuUh7UmXx99vauQZkyFHOgz0Qzo0vbNt0z3K3W7885eviRaI2SRAp9y0
	uRX5EZxDHaOWHj5kh80o0rtJCECCug1X7xc239ItstJdjNdLjPkp+u0i2wOVQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 11:03:40 +0200
Message-Id: <DJRD8IJUMKXJ.20CSZPRGGL3KE@bootlin.com>
Cc: "Qiang Zhao" <qiang.zhao@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-3-6c3e706e27dc@bootlin.com>
 <20260706-piquant-arboreal-panda-b810f2@quoll>
In-Reply-To: <20260706-piquant-arboreal-panda-b810f2@quoll>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_020348_411895_BDBC1AD6 
X-CRM114-Status: GOOD (  11.03  )
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

Hi Krzysztof,

On Mon Jul 6, 2026 at 8:48 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 03:30:11PM +0200, Paul Louvel wrote:
>> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario=
-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-ba=
nk.yaml
>> new file mode 100644
>> index 000000000000..1af99339ff40
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.y=
aml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/fsl,mpc8323-qe-pario-bank.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
>> +
>> +maintainers:
>> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - fsl,mpc8360-qe-pario-bank
>> +              - fsl,mpc8569-qe-pario-bank
>
> None of these were in the old binding. You need to mention and
> explain (WHY) the changes you are doing to the binding during the
> conversion.

Ok.

>
>> +          - const: fsl,mpc8323-qe-pario-bank
>> +      - const: fsl,mpc8323-qe-pario-bank
>
> Best regards,
> Krzysztof

Thanks,
Paul.


--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


