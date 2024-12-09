Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377B6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKABYYcUlpELS3JtbMMy+P5hW+1D0jPTVEQglxTqImo=; b=GXPxZTUnOfi8zz21Z8xfGPPfV0
	6O8hTiPjKBfYmhOlr6klVKXKwPS8HuO8Y2SEBzD2QCgDDgesKgKlHBGQFNC4YIwpWq5uvjZ75U60V
	iXFLW+KGrI+6jjcmEyeU614LztytS+z+kQosUqUAXAR9u+ZDkjojh7ARp0Guhf3m57XiXCYz4Z7R1
	yjCTpsv5/AkGNfVvSe/iRr8ugZTpRWMNCRkyH9QSkg6JQ8/WMQCDBes7Rl5VSNpbWflyNIoxozrqu
	2bpWp2xrX3HA+oGY4wUFZlepsyc408d0qHNvP507EE6UEExYAPR7NXH2b8Hx7ZmtGZYzH8OX2oZsN
	VP+Rr1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYaX-00000006mlf-3nej;
	Mon, 09 Dec 2024 07:53:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYZP-00000006mb7-4AJz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B84935C56EB;
	Mon,  9 Dec 2024 07:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ED8C4CED1;
	Mon,  9 Dec 2024 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733730763;
	bh=0tWTqSGiVFT/dCYy3N2L/Vl/4DImI7o+Xf6R8HXwG6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRf4GsO3FmNZENMToWx+Dh39CrsnyNS9g3a/82qSHB5ZHN3uOS1bonmqjMDr8m5l7
	 6ivYS8zmfgXF+FToCBnyiOWv/e5fINjEkRjDEZtZVn2KIfAjXYf20UktDRy9dOfOyQ
	 6CVm7pKXnWE3pJkpdTpr2zTd+z/FHmtz6kbv0b96g3dloLDZSDU1Z31S11ayu617Qa
	 yXLDPPt/0J0wg8xYZuXWpqw9+eBSyFRNvPUFgj+KXqzLbZuT4n4eYWws7dGDiKQ99x
	 mN1B3usa0iO0yVuRx9IXGVPNeS6HEYFFZs7L69mWxtG68ef8a71qJjWYC3ZLYFraGc
	 EXjxIiGiBhE4Q==
Date: Mon, 9 Dec 2024 08:52:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	peter.griffin@linaro.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for
 samsung,exynos
Message-ID: <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-2-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205174137.190545-2-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235244_073945_21079A01 
X-CRM114-Status: UNSURE (   9.73  )
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

On Thu, Dec 05, 2024 at 05:41:35PM +0000, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos Mailbox Controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/mailbox/samsung,exynos.yaml      | 70 +++++++++++++++++++

Filename based on compatible, so:
google,gs101-acpm-mbox

but then entire binding seems for different device, so you most likely
miss here actual Exynos devices.

>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml

Best regards,
Krzysztof


