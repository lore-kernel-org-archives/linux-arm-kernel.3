Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C221C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmEL6EhwrC/4U5BAdktF8uXgQAj2y987DowdjfdUmV8=; b=2gHF4vncqhS1zFDXseLABfXvzb
	Ue7/bQA/eMbdz5AAupwlXlefOa0rv5vUXu3ucY1y7AjCmqoWOOWvuOW18gf5EaVYt0sMAR6dS5UYP
	flryL/HSGedTStLksdLQn1lYWyuButrx/1Yd7TvrQEK1L+3w6MrGtufsXLj3FBDBfhlT0rBJvpAHH
	ze+i6FGKmFre/D6umok/UH+4h+KaYLJadOfcq3+rFPWfftQ10Ud2uOnNLbmRMsENyYhGcgdD74VqI
	J2hXCUqm6YZk1h8a05BVkaBK/5u3hiaSGVhGqvSaUCdpaRwXnrTIkULLSN81Dj3tP0UnCPeopiWcz
	KEBSwGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRGU-0000000FFjI-14h6;
	Thu, 16 Jan 2025 14:54:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRAT-0000000FE3e-4BKf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18251A41E7C;
	Thu, 16 Jan 2025 14:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C87C4AF09;
	Thu, 16 Jan 2025 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737038900;
	bh=kS1K6s9fmeCJ57o2iulNzC774Qqxf86e2tf+WDO/RDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7gWuPjYUDO+/EWctbZWV+AMVHKrCywMDcLItASnzieeMyQY3J5pRyoxlE3HB4JBv
	 yqOxikmYUw658NzU0t5IdPAVxOdMjUzyPTMkyR3BEh/NgyrIdQwT7QElDKGXkaVQ/l
	 1sk0ws2PzulzxViYIwEPQFGG5u+wRF6RaHJqK97MZ1H5su57RFSmKNXNCqtDbTj77F
	 3ccvynueLKPCLuhWyriHbX490mHK9SbDYVNl8ZzuU2EODvhujjW1PPy7e1wAiQREP3
	 p/VgwPuvt2vzwj15L8xSTjKWg3GhMJ5UPRqUHJ3OHo50SMi5uI7IaoEmpkvuBA9yLd
	 fctRPjnDoInQQ==
Date: Thu, 16 Jan 2025 08:48:19 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, minyard@acm.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <20250116144819.GA2270032-robh@kernel.org>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
 <20250115142457.GA3859772-robh@kernel.org>
 <a164ab0e-1cdf-427e-bfb7-f5614be5b0fa@linux.ibm.com>
 <oezohwamtm47adreexlgan6t76cdhpjitog52yjek3bkr44yks@oojstup2uqkb>
 <10c06fec-b721-4a7f-b105-c3c4c8358a47@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10c06fec-b721-4a7f-b105-c3c4c8358a47@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_064822_099403_4B5A6E8A 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, Jan 16, 2025 at 08:19:25AM -0600, Ninad Palsule wrote:
>    Hi  Krzysztof,
> 
>    On 1/16/25 04:38, Krzysztof Kozlowski wrote:
> 
> On Wed, Jan 15, 2025 at 03:53:38PM -0600, Ninad Palsule wrote:
> 
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> 
> Choose one - suffix or prefix. More popular is suffix.
> 
> I was about to say that, but this matches what gpio-hog.yaml defines.
> Why we did both, I don't remember. We could probably eliminate
> 'hog-[0-9]+' as that doesn't appear to be used much.
> 
> Long term, I want to make all gpio controllers reference a gpio
> controller schema and put the hog stuff there. Then we have the node
> names defined in 1 place.
> 
> Which one of the following are you suggesting?
> 
> "^(.+-hog(-[0-9]+)?)$"
> 
> This. The second part of pattern.
> 
> I'll send a patch for dtschema to drop the prefix version.
> 
>    Thanks. Also thanks for the other patch. It helped a lot.

Please fix your mail client to properly quote replies

Rob

