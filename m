Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA9CE65D0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 00:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoFHxlk/MxXl8zn0QsJEzFEW9uJPQ9u0jXpK1xuLvzU=; b=STSlUqxfwQ01IS8z+nHQ5vKiBS
	rBXcDoFeleDfhNnRNGoep/YtZZQEzrDcEJs7dpSm27dO5r5qhQBKd6yVJWmm5/u4fzmKR9zQaMQ3+
	+BkAmRixhdRDK+z2seMDbCt+Cqr4FaC1fqwTeT34QMem/2DXJEfZZhT8s64HDRKYAaHYH0ME81ui7
	ekS3+goQ/G2lz7XdYk2wzzssLrHN3qzDurTT82H5Nv+N8cdd4A1HwDeSFsWLVGBn7t6LCuerwL0Kb
	YdZ3B27I3ManwXls7/4TWm8I63HPqKndhkbDdu/XqK674TBqzAhpn8sjBa+9d3BrNFmgHvRu3Egla
	hhh5IBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHzt-00000001HkJ-4ABv;
	Fri, 22 Nov 2024 00:58:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHyy-00000001Hfz-0IrZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 00:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732237030;
	bh=NoFHxlk/MxXl8zn0QsJEzFEW9uJPQ9u0jXpK1xuLvzU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=FIL2dtlr7AuN89P3H/wj7W1MsXCkQvugxo0jOhi4kklYgD9YIbu552Ex6Wfk8ZIKD
	 j5tJJVKYcWGfxsKqHUJgJ3imk/K0OGO89bgnwrC2ORok8EbuTr+/vTe62yRfrv5PLv
	 nXtCr6yPUsf4BiMbLY0E04ZUXNpwVqgRnrjEye8MkCkQS3rz7mU+SAUj4V7JQETGXF
	 FNoCvU3y8Ial9m8D1vR1i9Uto7k8V6B96uvWvMc/mUGPDdIevtH7U/3VZ8E67Kbe5B
	 B9HIIrIT1PJTnG+9GjZMbGAA8blAVN28WlJAeEgg6VMN2UUd5EumuMzpgE3RayKKK+
	 s6NMQqjS+VKvA==
Received: from [192.168.68.112] (ppp118-210-73-187.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.187])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8C22268F88;
	Fri, 22 Nov 2024 08:57:09 +0800 (AWST)
Message-ID: <920e053a17d5f9a7d5805bcd674f036a9c7fb402.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/6] Revise Meta(Facebook) Harma BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: PeterYin <peteryin.openbmc@gmail.com>, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 22 Nov 2024 11:27:08 +1030
In-Reply-To: <b13e5063-3b07-43ec-a7cc-b19e73b7c9e0@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
	 <b13e5063-3b07-43ec-a7cc-b19e73b7c9e0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_165712_328955_4B6D1957 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi Peter,

On Thu, 2024-11-21 at 12:33 +0800, PeterYin wrote:
> Hi Andrew,
> =C2=A0=C2=A0 I believe this series' path will conflict with upstream due =
to=20
> version differences between OpenBMC and upstream. I will update to
> the=20
> latest version of the DTS from upstream and submit a new version=20
> accordingly.

Going forward, please make sure that patches you send upstream have
been tested on upstream (in terms of whether they apply to the
appropriate branch, and whether they have the right effect on the
system at runtime).

Andrew

