Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD628D3F071
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VhMoCs8T6Tzt4R6FnUGRsdZDOhvxg9vusVkkhl7NE8=; b=INc0NXWCcbEHrZfqDoLcmqgfhw
	tG8ba+uQrW7Jp5KZnuH7PZ7CQu+TXWptDQATbLk82okVqEmoCwbE8Et/RQFg1l18dVmH2PIxpQctq
	SgeUmFbA9Z7OANbxwSYIPlBKxnFM8Vl/e7ru3JfFmbJIkgnTXqnryql1kkc5s1qsBBzTXrVigyZ66
	aRyEQfpLy7XgHi99speP0dyDOmUAWmT8mIuWvOf5MOoDgLifQjhBw4Mi5q2/xHNqRqQe+xbAf8Cty
	QPH5aWlrPKW5RRBagoIofnQ6cgY60mBSr3IGOaED3wDjQfYpg2AK5GdazfXwI3FkYuT+K8Tz8N0/I
	2Khr+cQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6ce-0000000GB9z-0OPp;
	Wed, 28 Jan 2026 14:34:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6cb-0000000GB9L-2Vtx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2VhMoCs8T6Tzt4R6FnUGRsdZDOhvxg9vusVkkhl7NE8=; b=Jqd63wamWs5CSiGZAR11jjhdNe
	cZQLYkDv6jK4htGKRqG2qxUODl+86JluF3ndSWj/4zZcvApO+xXhyL0Zve00rJZc/RF6b5t+qbcYB
	tD2JU+D8/L8b4o7EPOJktlWKQ4RYLb+7AVvAja6MI3OARzkBiD5f2VhXNiXOwtEL8tqc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vl6cM-005CMM-6D; Wed, 28 Jan 2026 15:34:02 +0100
Date: Wed, 28 Jan 2026 15:34:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66c7435c-a936-413e-a016-c860d448c971@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_063417_640933_1116CDC0 
X-CRM114-Status: GOOD (  15.26  )
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

On Wed, Jan 28, 2026 at 12:21:41PM +0100, Michal Simek wrote:
> 
> 
> On 1/28/26 11:37, Krzysztof Kozlowski wrote:
> > On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain wrote:
> > > The xiic driver is designed to operate without explicit clock configuration
> > 
> > And if you change this in the driver, then you change bindings?
> > 
> > You miss here explanation based on hardware - how does the hardware work
> > if nothing ticks it clocks?
> 
> Hardware obviously have clock input which needs to be connected. Without it
> it won't work.

Should ACPI potential limitations be making the DT description less
accurate?

Would it not be better that the driver has an DT binding and an ACPI
binding? Where there are common properties, common functions can be
used to retrieve them. However, if ACPI lacks usable clocks, use the
of_ method to get the clock from DT, and skip it for ACPI.

    Andrew



