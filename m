Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99334C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImjMJ1+pYMOIPggoVvM4FCEFxW8M/Wh/4/oP7p2Rla8=; b=npKZaetLSThMp5HsJ9Ezqmmbkf
	CyFXtT5Bv2WO7R+hl7ChHeZMxOfqM+WgWOSdEv1twcMR3ipYKXndOK2cgx4+nAlyw9arcXJfupYve
	hpnC4slMbivYrx4+qPHRBLQ9RicX9dcIxfrokGbnjPK3II67cvxyqgipDtAc5t3gPTi+50eH4M4ng
	8jZ1GzzpGvwr8aHpvOi2gRRxY7OtLD81Mkn4VC7G4S4R/qIGNV138CpSrWOu/nnHO4SWBOlqb+uol
	NXC2GB4d2m6nq4VCkrZtZfTlMd0Yvmd1wwFRozPcGFZdgGapPHlbrrofbILl9iQEsqxcZC+Z33CI2
	sczxdpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Os-00000007ocH-3fQ1;
	Mon, 02 Jun 2025 15:48:34 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Df-00000007mVN-2KRf;
	Mon, 02 Jun 2025 15:37:02 +0000
X-QQ-mid: esmtpgz12t1748878503t61ff263f
X-QQ-Originating-IP: 6W6+bQXnVHQhbo8HPKV1XPMJMh78ckaDklHZl58FLdI=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 02 Jun 2025 23:35:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1004114850195244819
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
Subject: [v5,0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon,  2 Jun 2025 23:35:00 +0800
Message-Id: <20250602153500.1831349-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530031046.166202-1-i@chainsx.cn>
References: <20250530031046.166202-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MmPNY57tR1XnAuyHkoBJpNXrUgKouBwLgrWRV/UU1nW9ZU1Pt7nqKt1D
	PdOzyWadaH5bRoLPFOGkqMEKuYLTZXnb6j3IdrCOwfKQ2VCecQOO0DcP2yRUrYxPgTNtQom
	9t12Ny8U/6lcvyE7m5wAUoRZnnWON9/uLw2q/0ky4EuY7NsQariv1AUBOlUHrfn2jjXA6IV
	a0Nv2uWu+G3eqavtXp82bAPySYQ6TqUVMlWAnqymTDaPyovr97PFkVW8GzYkRTXexIsA+zy
	FFcw1gLYMt+yb+HktryrldIUGbg8cCA7G9BUlfIkfwviRrXlzZu1LRtT5gvfnsrwEhSetvk
	K5e6AItozI/8SNLfUJQdK1vCcBofJgyNj2vGGAHEj7vr6EEDdaeZ7FJbXM/LiAS5dcEMrz7
	9Bz+8nX8wXGfpE7nPNMbP9aUjOPR1rzoaYLCNWYC0YgAGsw7QYG7W1aDHfWWaQHOdDMVMju
	9CMbvyjf9r924t9R8yo85Eq3wTog3S2SnZegT8ZZshwgyu0GJL9y78IawDu3mrKaMnMA3Nc
	Ca3h8kWlKCLJgPnxJNudk37abgn0ufI8hz5HFDT4jCsp8R7AxTFh2/WN9yH3OahEtKjHqka
	EQI+eUFhnT2OfgkEC+fuhkdFB8gCkt+j+O7Od2W7JGP9aYiQuaiUhyYOY99KXIg4LNf56Fe
	33385UD77RjVGDuqO9sb6DUxeZXRL/vE0Cruvt3xfb1wVsbWh4tBMZmt+gy+3+YZco24SyZ
	emdq2naaBSwD6sEBD0enHT5UhNw8jCnSjGFDXVv8NlM1W/eEh1kfILBrabT8vH8tr/OYeNv
	pyt7Qtn/7C8hfW4ZtgYZcvSVk3FTTtsl8mOewTfWnH5L6nBp2zJIoaUd+WdaatRcepbCQEs
	zCDU2G6EbeHZt1HTxHEk995yEdXjGMuhdZZhYktq4/qqt0FM0xMjwd4Pr4YnyBa9jI7TyCW
	bHbUtqfoiGPFfKm/Cl7RElAFxzNuDC+tfgKdmZen+SIrSZI8xQ5UiVeUwudGptCnvhpei+7
	MpNKlDgNXlqVszmy6z7v3JnRDkzzh5OEPQ0qG7PQ==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_083700_115383_61FBADF1 
X-CRM114-Status: UNSURE (   6.20  )
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

> I tried to replicate on top of master 
> (24de2b9da3e28df323c1e096538ae1e035751adf) but couldn't, so I guess we 
> can simply ignore this warning?

Yes, the same situation occurs here,
and it has already been answered by Heiko Stübner(#2):
https://patchwork.kernel.org/project/linux-rockchip/cover/20250516012402.580468-1-i@chainsx.cn/

Best regards,
Hsun

