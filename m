Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AD6105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NT4m2L6ivd8x0uOIb1rF7dcCz1xDn9BnrIlOHXUGqVg=; b=JP/ocH4uatN5vE+5LgvDpXBhJH
	enmLzOq5ZsXafI/c1aNLIVdMpQnX8sET6dJZC9DDnvSdfPFD3cMnMGl+e3ONIlPzw/g8BlPCjL19u
	iwWhs+ZAcfPAz1B6zcuvYJuVhTZiv0TrtKVxMRnSZLdqm+4fNHgbw1EJOpafFiLeOW8JbYg/S/j+k
	UqH+bxNJmS3VY68T1fpXZRSczxR93Ka/AzViHRU3GEdALuNwgNiqvpBMV+yNN4LSiry4DDlqt0wEo
	CZmz26hamYb2PjXmyNuoKAryLVZdj9BqTJdNVR/+MXYOUHuMxj/APtcKSK7t9ZgGe0lQDmJ1J/J5I
	UZ8Rnabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LGF-00000001gNU-3wKw;
	Sat, 14 Mar 2026 09:26:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LGC-00000001gN9-3vVH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21C6F40460;
	Sat, 14 Mar 2026 09:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7DBC116C6;
	Sat, 14 Mar 2026 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773480376;
	bh=I0kYhW0BmPT/Cm2S7SgFFfnCYg7754lS3e+9dMO9GQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bimeqrTG5mTTo2RjPs0SpHZw9q0OtEJ14ixuintnXGYM/Kbf3t8WnJ5/AkqfL0qDH
	 Z3bTbIIynD/HWVmZzBmP4bCFWWcPKmWevm7JDzo0p+K/NMWFzjvRnFRlVb+DTSyQYw
	 Jkmnpzq9YRRuOc9MtWAdUcXMfmd0FlJPC7f2VpSJotESBnja/h7fEc8ekDg3Pu/paH
	 DohamW/UPqhW1Al9sKqXVxEfSIzVGGWQf+zFJ99iSpAijyQrVqUHLCVZNH4kCvYnZJ
	 bdRK8aoapEeq4KrM22vnSGPbH3fD0ErsYtfD8c4jZ4jKqblQJA63tIsrk+hplZh5Aw
	 OWl07m8L87ytg==
Date: Sat, 14 Mar 2026 10:26:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add
 power-domains
Message-ID: <20260314-maize-warthog-of-modernism-f74475@quoll>
References: <20260313114914.1564115-1-gary.yang@cixtech.com>
 <20260313114914.1564115-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313114914.1564115-2-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022616_993866_CC0AC9F7 
X-CRM114-Status: UNSURE (   8.81  )
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

On Fri, Mar 13, 2026 at 07:49:13PM +0800, Gary Yang wrote:
> The Sky1 PCIe controller resides in a dedicated power domain managed
> via SCMI. Add the power-domains property to the binding to allow
> describing this dependency.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


