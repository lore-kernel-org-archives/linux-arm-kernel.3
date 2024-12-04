Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8508DE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhj8LYO2k2u8HrLPuYVcO19yxTO8d3XXre2ihzyGvGI=; b=iRZCz+5BUKLszml7KIsJD93m6v
	zYupwN2f52FOSobmItfEKgKPha0x2FoAA8UUIDL/paJvNHbtZaFTnTkGIsjPg+VXJSYt+OYGBGeR1
	QXicTcqNbcUJB7rLH7gaNFxiUy+/4itjgA03AT0ar15vOUAMsb6VNzgz7no5ILlQSZQKBQ+23fmA+
	dfVU5bkmxC7YhRo5HNFfLTcrSn0GpjZDRohvf2pEmVxGYZkoFoNzs6zPNOMgzUbRJXAaKZDwuzS9M
	9l58vqkBZ4XuS/R4tKjhP4kJhAeQi7mOhhDRNv6zYw9Jo2IeYWhIxulmL1J00LopevLHioSfFKNhl
	jwU4+g9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrz5-0000000D8Yb-2L7m;
	Wed, 04 Dec 2024 16:12:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtV-0000000D6nx-3ogC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bhj8LYO2k2u8HrLPuYVcO19yxTO8d3XXre2ihzyGvGI=; b=Sb07Ij3h2rhhrzTfaVqs0MlCqS
	Q6vgaAOL12+WaIXg343RiurOYq3KUPaZ9P1M8r5mhsUWJ2rXoYk292dG3WvfuAzNTGu07jm1xBMRx
	iF6SlI0NFjYnCiVg7u+ZlCM2MTyRJ4USaQR4HSJc0fuOgBfpCMCcvXBYWb/Axl06ZrWZoALZfWotH
	AS6IcwAuvwWvX88GiQAJuNLtwXePYPdb++sqd8xADv/xqx7VI6MUmvTyS7ieBsQpkl9hJ1k+51J0z
	L/S9z70wn9z7JTwlvxyxUij7HnrH88bOj5LbLhMLJrwkgur4Ccz8c1tQQh0eki6xQyKEYltRRiCy1
	XFrzag5g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35436)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tIrtS-0003aZ-1r;
	Wed, 04 Dec 2024 16:06:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tIrtR-0005fL-0q;
	Wed, 04 Dec 2024 16:06:25 +0000
Date: Wed, 4 Dec 2024 16:06:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: John Garry <john.g.garry@oracle.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: arm allmodconfig build issue with bpf
Message-ID: <Z1B-AVPdkMiSyY-H@shell.armlinux.org.uk>
References: <9950a25d-1a79-42c9-ade7-dc51ef569ad2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9950a25d-1a79-42c9-ade7-dc51ef569ad2@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080629_945483_FE90B1E2 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, Dec 04, 2024 at 03:54:30PM +0000, John Garry wrote:
> Hi all,
> 
> For some time, the arm allmodconfig build has had this following build issue
> for me:
> 
> $ make net/bpf/test_run.o
>   CALL    scripts/checksyscalls.sh
>   CC      net/bpf/test_run.o
> net/bpf/test_run.c:522:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   522 | {
>       | ^
> net/bpf/test_run.c:568:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   568 | {
>       | ^
> net/bpf/test_run.c:577:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   577 | {
>       | ^
> net/bpf/test_run.c:584:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   584 | {
>       | ^
> net/bpf/test_run.c:590:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   590 | {
>       | ^
> net/bpf/test_run.c:619:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   619 | {
>       | ^
> net/bpf/test_run.c:624:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   624 | {
>       | ^
> net/bpf/test_run.c:630:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   630 | {
>       | ^
> net/bpf/test_run.c:634:1: error: ‘retain’ attribute ignored
> [-Werror=attributes]
>   634 | {
>       | ^
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:194: net/bpf/test_run.o] Error 1
> make[3]: *** [scripts/Makefile.build:440: net/bpf] Error 2
> make[2]: *** [scripts/Makefile.build:440: net] Error 2
> make[1]: *** [/home/ubuntu/mnt/linux2/Makefile:1989: .] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> ubuntu@jgarry-ubuntu-bm5-instance-20230215-1843:~/mnt/linux2$
> 
> The issue comes the definition of __bpf_kfunc from include/linux/btf.h

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99587

seems relevant. Jakub's reply in comment 3 suggests that:

#if __has_attribute(__retain__) && \
        (defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || \
         defined(CONFIG_LTO_CLANG))
# define __retain                       __attribute__((__retain__))
#else
# define __retain
#endif

is wrong - __has_attribute(__retain__) doesn't mean that GCC supports
__retain__, it only means that it "knows" about it but may still
reject it.

The nice thing about this bug is... it's remained "NEW" for three
years already, so likely means that it remains unfixed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

