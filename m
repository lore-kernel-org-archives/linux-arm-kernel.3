Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEC4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuLa4eedzbUwTpnlaZPmlkTyolIBXjzmkHFoMfgfTB4=; b=IHH7I5jeWUvUtzvs8Gx3JiPVj3
	sAYq1OnAB7/SMFXIx6FOzHpD4Zv0S+3NezvBIM+nILzKGBLHDOIpSpwgazxfU9D4o97Cf6yO3RPNA
	u9FAMZ7oX5BS2lSIkdbFotph7vPMR6WmkSnIax3wKFfGvcKqToYnV5TfOOvL279SZo3koCu6XylPO
	Oy48YnIY6JuosDEftjU/L3pA+P1jMvvqeRKLDxIpa3MgBCw+XlVHRrldMxpQBUxhuQZkHHRNvVMyc
	UouWOpEOJKWNc8g/FcO6TX0Tk7Gk64x4EbCXmSYONxLhj34iOefbehq5lpYFCF5Da8opokRB5lqKP
	doTncDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dou-00000006kZo-2x1A;
	Fri, 17 Oct 2025 06:20:08 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9doq-00000006kWJ-3NFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760682000;
	bh=LuLa4eedzbUwTpnlaZPmlkTyolIBXjzmkHFoMfgfTB4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=GrJehQx+sir5LqSm5whp4UV/1rcumxx6hSvrVCa2Fp8sbksHf12BtcyNy+RUFWzxj
	 yNMZ+60tOqqyITTdKfE8bCVdac927tJyq4PwkPjScJxb8d9eEjgKATv9vR9XdRw2zS
	 jRFAqy+gF/k0j3WxY4sSgIM+01MQz9yHeCH1aH1TOUl1bmmnM4s8YCwzXOrk/lGA1T
	 pSvsjeKNKtleawZWuq/0ASt3gbcs7JUA/pQhRpUqr4nzAkYiyaU8kVFIxAmoq0OX0R
	 WDo6zNhPN5+mli9NeEkORugtSF6d3zaX+qEzhExf/aHJAcJNak0n/dQTimSQQ8zFCh
	 yvAs4Q1Ycl84g==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 12B3A6477A;
	Fri, 17 Oct 2025 14:19:59 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Fred Chen <fredchen.openbmc@gmail.com>
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
Subject: Re: [PATCH v4 0/7] Revise Meta Santabarbara devicetree
Message-Id: <176068199902.287212.1469611481983268246.b4-ty@codeconstruct.com.au>
Date: Fri, 17 Oct 2025 16:49:59 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cfd50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_232005_055785_AF432426 
X-CRM114-Status: UNSURE (   8.75  )
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

On Wed, 15 Oct 2025 22:38:56 +0800, Fred Chen wrote:
> Summary:
> Revise linux device tree entry related to Meta (Facebook) Santabarbara.
> 
> Change log
> v3 -> v4:
>   - add blank lines between nodes for readability
>   - drop changes to already defined LEDs
>   - add gpio name debug-card-mux and FM_MAIN_PWREN_RMC_EN_ISO_R
>   - enable amd apml interface
>   - add eeprom for prot module
> v2 -> v3:
>   - remove mctp node label
> v1 -> v2:
>   - add 'bmc_ready_noled' LED and update commit message
>   - add sgpio line name for leak detection
> v1:
>   - add sensor nodes for extension board
>   - add mctp node for NIC
>   - adjust LED configuration
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


