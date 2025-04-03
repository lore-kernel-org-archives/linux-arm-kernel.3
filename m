Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C422C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 05:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+hB6TfsNEWsOBfPe7+0Du59DxYe84XYO03aEf1oq2w=; b=Oq30brbVLN5ryZXaxpjn26hVBh
	dC0mUZtsP98y0S4+t+fPUPgPt5mr4ViSECZ7/fTAsL4J72BhBFx4HylB+SUU49ynQAqhOZs3v1ELb
	EIAX2pDD+mRn/D3kqM6DCOEKqu+bQr0rIZ6NilJrIUoZlR1pQauI/aY1csgXnn/O35OqeSFApoykd
	aZzppyK4H87kOanPCcX1Q8bOESmTYdHZ4s54Oq4G716CLSwlWfJKcVOzIej9XefaR+/nm1W162fOB
	dMLCuGbOYu2HNRW54L9QcSei75TnxJDKKF5xMG2Ek3tAlZ3HArVLqyARX4DyHpsvDr7rnpd7lhz4R
	PW3vWOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DbO-00000007rUm-2e8M;
	Thu, 03 Apr 2025 05:58:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0DYt-00000007rFF-2ShI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 05:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743659775;
	bh=e+hB6TfsNEWsOBfPe7+0Du59DxYe84XYO03aEf1oq2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YeCqwMTkAaEXEzG3fK/V5nJFzmxl3eQwO96YkjdDajs7/4XBWpWWkpkVQreFkpou1
	 nVMQFT9n7e2USYGg8wPzyjE3Z6I+DQ67V6uubhy/NZ1HPGIEvUJ3e2trugUKOj0z+J
	 SbR4yaIks8jZJI7qZ4qENCQG1aLlcO/Jug21dgd/emU8StBtjUuCeRcj6N38rqK4EQ
	 7BOPvqng/pk6T5qmR3zdUTwCuSdj330tEgtjfGzM/ajK02F+g615g7YpTVMG3jP9Sd
	 HB40N5nrMRjJM21CtMtB0gdfFlpL7fYPvP13O0kKRL8B4X/aILvW8g+iqpeJG+yzm+
	 GofwYelTCS5NQ==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60B3C7B352;
	Thu,  3 Apr 2025 13:56:12 +0800 (AWST)
Message-ID: <ca1f5dc3d0dd53dfe6abd9d6bea98838980f0840.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Willie Thai <wthai@nvidia.com>, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com, Mars Yang
	 <maryang@nvidia.com>
Date: Thu, 03 Apr 2025 16:26:11 +1030
In-Reply-To: <f563b33e-f552-4a3c-bb45-6b7add876fdd@kernel.org>
References: <20250401153955.314860-1-wthai@nvidia.com>
	 <20250401153955.314860-2-wthai@nvidia.com>
	 <f563b33e-f552-4a3c-bb45-6b7add876fdd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_225623_975240_19EE13DE 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, 2025-04-01 at 17:51 +0200, Krzysztof Kozlowski wrote:
> On 01/04/2025 17:39, Willie Thai wrote:
> > Add Nvidia's=C2=A0 GB200NVL BMC board compatible.
> >=20
> > Co-developed-by: Mars Yang <maryang@nvidia.com>
> > Signed-off-by: Mars Yang <maryang@nvidia.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> Why are you faking tags/email addresses? Read carefully submitting
> patches. I really suggest using b4 instead of manually editing
> things.
> And if you decide for manual way, you must never, *never* edit
> people's
> tag. You can only copy and paste it.

I've applied the series, fixing the tag in the process, along with the
line-wrapping of the commit message in the second patch.

Willie: scripts/checkpatch.pl warns of some of these things. Please
make sure to use it in the future, or if you adopt b4 as Krzysztof
suggests, use `b4 prep --check`.

Andrew

