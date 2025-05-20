Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA2C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaUCE66xeXpissASvXOD2lj71rIVnrG+KJJg8/flEbA=; b=ZSmlKq+S9Z4zS7ezoPGe7IZ4DH
	Rs02uNC67Uo05mp3VXXaEEmpg7WyEnOT9Il5nuZFxO3lOLv69X4rz6NPNh6F9d1gsWUP2uoV51v2U
	n0f8IKEYG5avHbUXRp66q+ogmHkpl48+BBaAPbRuNjuj8lnhUwcqJ+gVJyom3zxr75knTS5NkYitd
	rbuMxzhHswAKH+gEjh+YrM/3ufijIFbpmY/n8axFeI8LXtB/nf9WKUC9gEfL0WDSFG8LktrCQIhrK
	CiGftGlnHtt54hMqLyeWWC+FIZLn+IZXiKx0w2cZmRAY7o7iVabPhEyUBaJ8JQk7SFGsdJkjKSilY
	c8CZMN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCMT-0000000BIQ4-2Uol;
	Tue, 20 May 2025 02:05:45 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCIp-0000000BI0m-0Aib;
	Tue, 20 May 2025 02:02:01 +0000
X-QQ-mid: zesmtpgz7t1747706449tc2ca6122
X-QQ-Originating-IP: MJX7unsbp3LccLzJ3lQxq4cDUsWyjuL4NHekkcViH1s=
Received: from localhost.localdomain ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:00:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8091902389389693437
EX-QQ-RecipientCnt: 15
From: Hsun Lai <i@chainsx.cn>
To: i@chainsx.cn
Cc: andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	inindev@gmail.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [v3,1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Tue, 20 May 2025 10:00:46 +0800
Message-Id: <20250520020046.2387034-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519085614.2245892-2-i@chainsx.cn>
References: <20250519085614.2245892-2-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MRlJlBnjh5AJgzS3XbnJuDPCHwOLoTmpU2axpJdzDp5evGfk7FEEAeSG
	11WfCRJkrJGLeEbasug+5auueEIRoruDnYMCphlddQ1hYWci2sGLAAkJY/guD2BRY64S6RM
	dAhSlMcJKVEkagEO5CACp1gL+GTnnr807ImFywYVB3apzZDHn8T8fcNITv+bzIAl717gPVz
	VYXYeDozO9AdwEY8hy75cb8X0WjAqcASNeLKLPNlzy3Pv3Wik2PKKL165Fm1LeLY//xurkq
	RTf/IbUsvL24JiT31+iC1JUbQJfAYk5+lJivPc4hzbVVlpDFSbAndJeMgAp/IRNXVo/nBvw
	RNAU6JWCuPZZI5ZzBN8aWttWtLQmbRxWNpwuDm/zyV3nYrwVMTRONbXfFas4OWYAjIDDKzQ
	iu8c8DiDqpLLCzAaDoHfIsgXNKwY+kwChfcZ5Jvz5GRtawzomvWEgmV25dbMkM7mCPQCde2
	xENJ4CPMbwiaFcml30x9E3cqeA/S6ZQaX7Vaw0Q3UKI9VsIXcXdDFj3gWUGGguTNF0gXzeE
	gsppK7vLR7I2yF7cKB0zfgCTJBnKONZqtpkULQVLQWIKU5Etkf/vNvXjo12IuzvtjXOIYVr
	XuSX55zlEo7SwRXWAqn0YNAS1QbE7U6BfMd8oiJhlM+xPyYwuEnT25oApIqrNHgfMVp6TKB
	XnT1+6qmVaQFHVBK01fYHOoxnl+r1dpUc06MvOGBpRrx5Kg7fQ9TCLYlQrv1nDbCJb3co3k
	oB81zQtQAp9qQ4cl8Kw1vVxUVYX4fuu8hHyaQQublcsNRkM67KwtegfBPsNRfO0Dwci/TXg
	psdFFUu2f0MUIDdJgLh3BRFSCA/HvDzpEXI4ErVoA60KNmobOSuAy0rFkstPQqz55b2gkir
	2+RiUGsUU6ZdV2sJC2aS1E1o7pHatbovXwQdq9WIKJId6FuSwGka5HB1nE3GRp9OeWpoh8J
	KRJn3IHAI5ejXCkwGSHTTFk+v
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_190159_509527_528E9DB8 
X-CRM114-Status: UNSURE (   7.06  )
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

On 19/05/2025 9:31, Krzysztof Kozlowski wrote:
> You ignored comments twice. Repeating same mistake, even though it was
> pointed out, feels like we are wasting our time, so please avoid that.
> Go back and respond to comments, then implement them.

> Best regards,
> Krzysztof

Sorry, this is my mistake. I have fixed it and will release a patch in the next version.

Best regards,
Hsun

