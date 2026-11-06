Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C7606A93B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sxDTLHdX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=S2QXcn4R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PR4/Dmfl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Yu0+6yyRJOK09C6VPDdgbU03joVf17Ur+yrOL92GCs=; b=sxDTLHdX19tbR4ZaLmAb1k4hd/
	LZ6UvwEA+Mmmp7IWVoqd6zsNeo7Z4VPXXldCEik9P797ghpFPIELs3+obWot7On9UusmpKI140wzl
	C++OrEq2ZvBGZxyYtZUPpbOVtosUtdAfO+yEYhzsFx6TBuBxVQu+etM2nH3ULTtMfalulk1v91jhy
	KJGZU+Q7RZCF26Ui0WMj7lPEd1eCbBmVQ9N1VRC8ckXSMSRgPMCDByyWHOYjUzwaIRxyH4kfPe10y
	MbyAE33J4vciKC0kmOORsiyUVNS0USh3EkyiVMOtkdzdCpUNETh++obQp1QbmQ/E+4Yqmcs5dILg2
	3TYB73xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIQU-0000000CC7J-1pCO;
	Fri, 06 Nov 2026 11:48:10 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIQR-0000000CC6a-2IIz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:48:08 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 5577C1D0018A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Nov 2026 06:48:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Nov 2026 06:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793965683; x=
	1794052083; bh=2Yu0+6yyRJOK09C6VPDdgbU03joVf17Ur+yrOL92GCs=; b=S
	2QXcn4RT9dWI2zlFvAypefz+0IYHq3oU6Oi6Pl1tzpW1AeLstop83UJQgHe8yEOn
	dQqPvW9+ZE6SmrS327Gm9xpsEp3lOdHzAzxArFZtB6jJf7xPoySSOtapYuKmkgZR
	5gTzxhHO/+5hE1oXVLZEZleZ6Of6tk3QxC0dJfr3OGbqqrJsVaVfNqaLEQN07VVC
	5Br3g0MAlYt3rHJH8kS7zBxvrTdEncSgYrQCsPrK4vaHnwVNQyNoQ0nLjq5Cq+Ew
	7Wx0mgwFUuhLAEygJJff4S9Snmq0VI6ZXTfmDqiOp6/xFFaT6I4onc8ow0p1Z/r/
	cuSyT9+mhZiLqrD6orVJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793965683; x=1794052083; bh=2Yu0+6yyRJOK09C6VPDdgbU03joVf17Ur+y
	rOL92GCs=; b=PR4/Dmfl8Mdq1TS6LXKLCUfEl7iCen9pfMVgRSbZd6CwQQhArr9
	A6nVYXmGzR+J8O9aGqJLeMZ7xRlovgfNjIFypxqV27z6sQhZSe79O8Dfi1mDfj/H
	yB/gOmAT83LP2QDy6Bg1fFvFvZAp1KylilQ+yUA2ygRLZKItk/YC0Vh4+cmJxKSA
	06ZZNCL29VPU1CrKHAA5iBME7/npMZ1I/+Mpb6Kn3jrxfIG8saSizvZiHqO/f82N
	YozAwc5YroZHEr4jBhhDcIgcYKg1RhURwJRM5+1whvrIbNV5VeHwZhWGfQH6JhZL
	2BtoRp1RIQvE5mfw+9ut31o04KJQCZaFBAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793965683; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:iAqiJOUcNbAXJnwoVZNlnac1uEgdEZR1q/dAN0TXalC48Jb
	TWOeQNn98wIqtgVzpAIqJFuDGYF6JKguRB01gi68Jxnj3+sR+39mW3uGkZnfNx/I
	4dQtk07RQjGSA2sNrrmP1VQIYjpXr4R0oUC963WEMeO+eKBbr4uvKiLfubJFLxiH
	yOV7jZTaqw4QS7/+I5qVLxLlD4Zvm71/+kD4E90yZ/2vhXkMZTzUMzDYgcSH7vdL
	IxwRqMPl3EY2/Pihaiq83w8/dJ/lcFo2OTvOJds0+05YyxTAqKQhrVT+05X7N7hw
	PnYZB24mU7nUY20TmgvgAnzXgI/H3Z02RUqaZ5w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FmEDi1WRQcklZBu57Cd/S7wSjHsUwH00f8wV7s5cSYI=:CAwZkgiAf0SgLFydBf5LAB4mhQO23W7Kk0zf8AYfp0k=;
X-ME-Sender: <xms:cr7taphnteCOd-mfnf55XdPbxsN_wZBVDEC32FieJWcOMQjrGKC9hw>
    <xme:cr7tahKuk8trk2ZTlMfB_M3hMe_tMcaMx2HAuPmqwdoMchKffWaItAvRz1JVlWkjQ
    meh-QJPbCHp2Z_y5coZ1IPjLy7n0DXL7wLQ4ENVLuRotv2fSGuR_ynQ>
X-ME-Received: <xmr:cr7tamjbHZUSTsk5BXOqJ2KZtfMJ_Qv7fITMTlS3VwatxlIFDLqAMYcuNGo>
X-ME-Proxy-Cause: dmFkZTEiP1kE5K2AjXPUGYL4V08xpaDYMmso/I3ZYp5NQ0mOY8VtVcT+3RreC8z2zSjnIj
    8XGwylpC/E32VYxSND/PJg3iKj4y3As5QXupte01kfviCQF7g1D7gxMnAOjOyE5Zr+hzkT
    33xzjOP2MI13X7E4Y2Qf+9hmgqdREAwWEz/0c0FPFkZWREY3jPnfv2WCE68RdEfW1T8RfP
    vMasPkCAbpQwmVYnSxS4JTGiRzx7nS85KyizJXI1ZMlj1eYdiB1Ebv05Ea7TicR2hLANIL
    JEOaLreHdqcIPuW0axq0aDWX+VvBCC8B/Rn1sPZh+0wSMtKC2eo1s2lm92ylORrXCYf+Z1
    DrhceeY7DzK6E5Cx6mrw1O/0ss6gQ3rwUQaH4EM4Cuhg1tQiYQMtx+E+WYKn+8tw4GD6T7
    lOp8h+EZHmw8klpYGZ1RS1MPj5cW5F3GJ9cnGT2Hbijz8AMOeOZqc6Hh62oudB/EpuFuJS
    RB2mAihyoWDGgnMs2Wzh7tFD6nLFs3amBnW6mDsAtkMEN/2OYz2JtSU5Qi70HwMnOoVGvx
    mUJaVahLbJ3AeGFzzUa/PiY2CXW+7yKKaIEUqnK/8hDh928QFJXf7Bx+BF78b5bDvxEnOr
    ABjbIOsAou5FWBXBDhn49M+D2occqn2qbKwnjm+S4uUIvP0JYtuIwOrptuEw
X-ME-Proxy: <xmx:cr7tai1a2NN1Wfb-8gnJU_CtSMIAYzG2Z_e2CFXKzK26adlsy6LWCg>
    <xmx:cr7talYBfPY7T7JjORebcD4YAd90QwTDfD1SrdvYnUHkLEqX4Zqi-w>
    <xmx:cr7taii50ihsTw0GtDdOjV244lhz_F0L-b5tSl2qFwsKdcny9j4tvw>
    <xmx:cr7taud3JN8H0iC_0FrE4G2qMD6SKoUAAT_UvNhgE08sqNPAmqGBrw>
    <xmx:c77taj2B3ADjw-KNQp6DSH_54H1PPdDXS0Q0xro1Y02FnjXsyqoiCs6P>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 06:48:02 -0500 (EST)
Date: Fri, 6 Nov 2026 11:48:00 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <au2-GegBg8kRmBs0@thinkstation>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
 <auzM-l40BLsT3clg@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzM-l40BLsT3clg@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_034807_628242_B9A597B3 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 06:37:46PM +0000, Catalin Marinas wrote:
> Worth a separate patch to fix SDEI handling with pseudo-NMI on and no
> changes to __this_cpu_read() above needed. So, for this patch:
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

Would it still make sense to switch to raw_cpu_read() in this patch for
stable@? The splat is new with this patch, so without it stable trees
would also need the PMR fix.

Let me know if you want a re-spin with raw_cpu_read().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

