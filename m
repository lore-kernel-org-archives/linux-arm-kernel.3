Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1446CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF4geJPizXwz+Vvc9PhYKe2Due5htIQsfI6rr6h/nk0=; b=l/8y3foC4taBGBRa+LsFqGM/WU
	tpXYA1Ohvpgesefr3p7fQZ/6EQ3rt+iB6d6nDk8vaqG/rpNMWZZkgsM2zIdQodQQxw9a5CreGL+z9
	ZQg58KprD8KIiUI5padVIHS5GA7hHMXYlL9/N1qxFqVLYuBNotb75a/87e3ADIvxYgdv5KSSlVhdi
	Qhbpxe6QV+kjOUxZRXknD8mge0I0SevrjB+BsQOaN/H25ODGxzTs885QVMfGPBhZclqYxiwytXCeT
	0oEc8EewkELDeqqDzJiuPE9ParPgL4k5Hpg5Ek71godBqMxBH7+rNsKdKHixPIsWx4dSQ75GTm6dN
	fApj9xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4as-00000003D8G-16gP;
	Wed, 27 May 2026 03:06:06 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4ap-00000003D7h-0Dju
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779851160;
	bh=IF4geJPizXwz+Vvc9PhYKe2Due5htIQsfI6rr6h/nk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BoixamT2E5JqxH274O4RVLgy39fLf2XmDHEcudXvmtDQCi8slpm/b+D6rdTV/89Zq
	 6TSnbbWucDOJC/tbGPUyBQRRRW+6vVs28L481iyGUQHktTxj33K0TnPkTFbHmr5mNL
	 F1b3t5ovLfeqmlKOfnJE4XfVfgjIzg7r/TnGHweKAviWNKTMxzCwMV2zswHHNS02Gf
	 KEUeOGYHfXSLLCxNgt2ahuROfzsurvj4QWJ7evOFOdR7q83MaImp71bajepnikGgl8
	 6D88/o6hTr+RmQI7T9YhbdT3sIjkGVilR3lryT6IAvIMQRQY/xlMS5AjNifliC/wzs
	 DxCIhhjJ7c4VQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3DD696001B;
	Wed, 27 May 2026 11:06:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mike Hsieh <mike_hsieh@quantatw.com>
In-Reply-To: <20260522-clemente-dts-remove-iob-nic-tmp421-v1-1-ee2509a71502@gmail.com>
References: <20260522-clemente-dts-remove-iob-nic-tmp421-v1-1-ee2509a71502@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: Remove IOB NIC TMP421
 nodes
Message-Id: <177985116014.389804.14182803385657639805.b4-ty@b4>
Date: Wed, 27 May 2026 12:36:00 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_200603_288006_7FEAB27D 
X-CRM114-Status: UNSURE (   7.80  )
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

On Fri, 22 May 2026 18:07:59 +0800, Mike Hsieh wrote:
> Remove the TMP421 sensor entry from the DTS, as it is no longer the
> primary telemetry source.
> 
> Accessing the CX8 NIC via I2C while it is powered off causes voltage
> leakage on the bus, leading to EEPROM corruption on shared I2C devices.
> Removing this node prevents the BMC from initiating traffic to the NIC
> during initialization, protecting the integrity of the shared bus.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


