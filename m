Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC7EC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT8k5LjLLvh2MY0wAY8O50/66/NB//SWn1zAYfy8czU=; b=L4WmbLfmuZNmz3KivT1iXYDrCx
	DOKwLGl5h8/Yl2uUpR5GX1Lt0jkT+nbvUwrGDPxawo2yZtWo5G7Wk5eN5oUtT9vX/jAZyS/GB5DUS
	RV8AAjcSytffmKJggGWfVOxe+9saQB8fa7b3RcLpSOS3cJN8e2ln0twNsSDXK8aFBo6fsajVXBsMV
	qKh2FyNs3QvdjG0G+ETEy8q/9JcSqKOMcvD0EQpmt3JjQTut8fEWMZaJ5h7dKHdp0mdp9m6TpJXkA
	qzYQOZqZxOo90gMDyyNP/UQ4RY7qVP3NibEeVk1DpG1PaYSV8m9Xx+8L7mMEfjKEJiA04fGzXPxSU
	tyzaMxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xj3-0000000GHwl-1q6h;
	Fri, 11 Sep 2026 09:39:17 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xj1-0000000GHwT-0Ykd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:39:16 +0000
DKIM-Signature: a=rsa-sha256; b=rL9I2asM2wzcKZu5x8wP9FpnB9b+1w26/CzgPi5sxemhJjKxJdbWU0GUYwukHJjNWfJT46evQGu71Puuc3FEmDNbc90fM2uxIlFufNKJ9E4cLhV0CWFLg9Q8y4gvUU0ZiKbSS5tTjg6k/wfzFFWmrnByX43uvQGkZCim85B/nEplninSCtR4JyFiwjhj6BJ08o/m941KVBTUcGt5+lAKHEJ/FeVZUD/vIExiFBqstSvly+JXWp5NJDeJFC9ypj9Dn5BuouOqRZ8l9a/64WSrMcdqFeqrDybcQrzjuV4hO3J33G3vpRaxaEy9HBMTFTUxFZqHjjO8dFP6qEVdAhED+g==; s=purelymail1; d=purelymail.com; v=1; bh=RIReITS/4nOgxYYXqRyKfSmV6SO1lyFscaEQmy52b90=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -364201085;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 11 Sep 2026 09:38:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1x4xij-0000000ExW4-1mPw;
	Fri, 11 Sep 2026 11:38:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Michal
 Simek <michal.simek@amd.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
In-Reply-To: <20260909182641.165383-2-marex@nabladev.com> (Marek Vasut's
	message of "Wed, 9 Sep 2026 20:26:05 +0200")
References: <20260909182641.165383-1-marex@nabladev.com>
	<20260909182641.165383-2-marex@nabladev.com>
Date: Fri, 11 Sep 2026 11:38:57 +0200
Message-ID: <874ifwjff2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_023915_252172_45D5BAB6 
X-CRM114-Status: UNSURE (   9.09  )
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

>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:

 > Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
 > The board is populated with four ethernet ports, QSPI NOR,
 > eMMC, UART and USB host interfaces.

 > Signed-off-by: Marek Vasut <marex@nabladev.com>

..

 > +	chosen {
 > +		bootargs = "clk_ignore_unused";

Why?

 > +&gpio {
 > +	status = "okay";
 > +	gpio-line-names =
 > +		/* GPIO 0 - 77 */
 > +		"", "", "", "", "", "", "", "", "", "",	"", "", "", "", "", "",
 > +		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
 > +		"", "", "", "", "",
 > +		"ifm_device_info_eeprom_wp",

NIT: The dts references a number of other GPIOs, any specific reason to
only name this one?

-- 
Bye, Peter Korsgaard

