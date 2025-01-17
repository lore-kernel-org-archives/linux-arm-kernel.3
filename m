Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5E7C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHE0BkS4uezfMVmCTcS8aBzZxiVyYxfebZVYVHoxFqA=; b=CaV7iPzZKhLREb13EeXnsesvo5
	G5KDLjviTCE7egAyeOztRqcqUBm1ctZDE5IWJhtOyfMGvYK6HXX+cR2VEyLytLi/0abllcoQWwdKU
	IvOQ2JercSsoEz/95jnG9gYGUD5hUTEjkSuEWcyM+bSslxwmbJ8g7GllVn5rxv0oeh1B+S1C93nro
	NWQA25U6yEtGyHXnvw89z4s57gxhPJSWGMR/7odaISaLhWmT8ffPW7EPYir6pU4cnDcy5KIwaPdyk
	DJGms25L9Or3S6keJKXP+4zHMSzw5NPU6Kwmn9B3X4M60fIteFBWmT+5H0900ymONBICjmChE1c6+
	3aT3m5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgux-0000000HDjd-3WTj;
	Fri, 17 Jan 2025 07:37:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgtg-0000000HDdm-1Qcs;
	Fri, 17 Jan 2025 07:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFA5D5C5E12;
	Fri, 17 Jan 2025 07:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C6BC4CEDD;
	Fri, 17 Jan 2025 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737099363;
	bh=9rLx3+q2I7YhaRy+3wWC+fJ4u9j5KzJ/7HObezKZmEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvZWLzNVprCTnh5J+bcC85LIvSzBxCJDK0QtqenJSMSUw1lwJk5o8myPfMLb+xVmt
	 qiTZ6rzKZ3tdrLat4HhHM6dMwO+uFpWQGF2MJsVjs34KuuEWZtzggchLrqZbMs3Wcp
	 stG8PNylJglFFiOeMRqwC65kaSw1jLxm847ni7jQUWWQm9B2+Aap0L3JqGUYyLglws
	 BhzqYn06JfXRkK7wUNx2vdLGMGWDSrmiYQlpPSgqDZeL8dQEeTnzqGsJlBkVZncSzT
	 ZI0nmOX5JW4QVEv95+0l3ekYRfNZPSxUE0PT+qS2YM7ZgmPZx1VEWdnU3lzdNtZF9j
	 pu4NI29O4yoJw==
Date: Fri, 17 Jan 2025 08:36:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Message-ID: <20250117-gray-falcon-of-ampleness-03be68@krzk-bin>
References: <20250117032742.2990779-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250117032742.2990779-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_233604_425096_1169899E 
X-CRM114-Status: GOOD (  10.95  )
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

On Fri, Jan 17, 2025 at 11:27:41AM +0800, Kever Yang wrote:
> rk3576 is using dwc controller, with msi interrupt directly to gic instead
> of to gic its, so
> - no its support is required and the 'msi-map' is not need anymore,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v5:
> - Add constraints per device for interrupt-names due to the interrupt is
> different from rk3588.


Test your patches before sending. This one has obvious syntax errors, so
you really never run a test. That's wasting our time.

Best regards,
Krzysztof


