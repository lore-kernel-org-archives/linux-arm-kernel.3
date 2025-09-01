Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30705CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NS4t4eJuUp0jYCV3ytpg1nOEw/rsxFMXHFVgHi8QC5Q=; b=RWohQlux0LfpdPXAhGW9QYiza9
	xbwoBY5NT4ktrJbFWCK5BhdaQj7L+LLUZuwk7ehPKxk2OC6xZ+W6Dhhsex8PSMAwXJ7/3paLzFHTc
	2MPVyT1WoXmAp2Ta0prEk+kOgnRhdzJS2xiEwbsI1fcTkL8YCaeyw8U0fXkiP6yuxsUVT8ad4+lEY
	IL3Sc90cUq91Nm+Yg9RiKefrCYat8DGhEeOzD9E4PXrPLAILZddGwDKieSbviBimiUEviwvOjwe09
	6lhnnHIuOiotAhBfRWCKN8R94pXZh2brJARo5VXEr97V/BdL2ykng3zPFTBnto0FFDYKEXYU0UBVQ
	wbodfmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Kf-0000000DSSI-44gg;
	Mon, 01 Sep 2025 17:28:42 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5BC-0000000Cnva-1gt4;
	Mon, 01 Sep 2025 14:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756735600;
	bh=1XxOBuK1jPvFLidfH5rRW5Wuh7M+R0jjZsE4m5PIeq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lWVjHllmo3jYTaed4r5Q/1QLUNfK53lNVMW4umuMpR29lSr9OFwE8VUOSdcp+25kz
	 6ipWcMn8xufiYrbZV7p+dV11ieWCHY9PdooMt3sNIOqzX4Q2t5VJCSmB+fVZ6tgZud
	 mLy9M8QzyBQVCihEA4ojHSskIBmvdvr4pPJ+6sISE6F0Hps5FcV2DQgDMDlNMCHqmQ
	 JB5rlk/WDMW2PDy3j7PCs8bvh0JMEgWPYTG8ekRtzYajdXIUi/MJW3Uf36QE74Y8/M
	 FxnjSEGENaSnLpRKa314H9JR8z/2wxhkcvakZLnbtTs9kcsB4xNd1nBZDhGivW8Xe2
	 IWM0j6cCKYAzw==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50be:5a04:892f:ee51:308e:70d0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 4AEFD27E468;
	Mon,  1 Sep 2025 14:06:40 +0000 (UTC)
Date: Mon, 1 Sep 2025 10:06:39 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Andrew
 Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Message-ID: <20250901100639.234ba07b.xunil@tahomasoft.com>
In-Reply-To: <20250901062437.780cc71a.xunil@tahomasoft.com>
References: <20250830171409.592c1f63.xunil@tahomasoft.com>
 <20250901070008.68662-1-amadeus@jmu.edu.cn>
 <20250901062437.780cc71a.xunil@tahomasoft.com>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_070642_687665_8922B78D 
X-CRM114-Status: GOOD (  22.83  )
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

On Mon, 1 Sep 2025 06:24:37 -0400
Erik Beck <xunil@tahomasoft.com> wrote:

> On Mon,  1 Sep 2025 15:00:08 +0800
> Chukun Pan <amadeus@jmu.edu.cn> wrote:
> 
> > Hi,
> > 
> > > Please change phy-mode here to "rgmii". This change will yield an
> > > ethernet speed throughput change of a factor of 100+.   
> > 
> > > Same as above: Please change phy-mode here to "rgmii". This change
> > > will yield an ethernet speed throughput change of a factor of 100+.   
> > 
> > This doesn't make sense. When I first submitted it to coolsnowwolf/lede
> > in 2022, I used "rgmii-id" as the phy-mode, and it worked:
> > https://github.com/coolsnowwolf/lede/blob/master/target/linux/rockchip/files/arch/arm64/boot/dts/rockchip/rk3568-opc-h68k.dts#L24
> > 
> > Are you experiencing issues with both eth0 and eth1 or just one of them?
> > Are you using the generic-rk3568 target for U-Boot?
> > 
> 
> Hi Chukun, thanks for your response. 
> 
> At Andrew Lunn's suggestion, I'm doing
> more granular and rigorous testing, now using iperf3. I'll post more details
> of results here after I retest a couple of scenarios. 
> 
> However, I will report now that so far, I'm getting better (faster) and more
> consistent results using iperf3.
> 
> ~Erik

Below are my results.

In summary, the speeds in certain scenarios are closer than in others.
Pooling everything together, at the eyeball level, things look pretty similar
across using RGMII-ID and RGMII (no internal delay). If I were to run these
tests repeatedly, pool the results, and do a statistical comparison (probably
with a Kolmogorov-Smirnov (KS) test or similar), I doubt I could reject the
null hypothesis of no significant difference between the two sample
distributions. 

So what I said earlier regarding rgmii vs rgmii-id DOES NOT hold up under
more rigorous and careful testing.

Thanks,

Erik

___________________________
Results with (gmac0 & gmac1) phy-mode = "rgmii-id", tx_rx_delay unspecified
(kernel on boot sets tx_delay = 0x30 and rx_delay = 0x10 itself, both gmacs) 

eth0/wan
iperf3 -s -F VidTest-1.4Gb.mp4

{openwrt device is 192.168.2.241}
{desktop on openwrt WAN is 192.168.2.90}

-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 192.168.2.241, port 44414
[  5] local 192.168.2.90 port 5201 connected to 192.168.2.241 port 44422
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   112 MBytes   935 Mbits/sec                  
[  5]   1.00-2.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   2.00-3.00   sec   112 MBytes   940 Mbits/sec                  
[  5]   3.00-4.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   4.00-5.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   5.00-6.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   6.00-7.00   sec   112 MBytes   938 Mbits/sec                  
[  5]   7.00-8.00   sec   112 MBytes   940 Mbits/sec                  
[  5]   8.00-9.00   sec   112 MBytes   938 Mbits/sec                  
[  5]   9.00-10.00  sec   112 MBytes   940 Mbits/sec                  
[  5]  10.00-10.00  sec   384 KBytes   815 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
        Sent 1.09 GByte / 1.09 GByte (100%) of VidTest-1.4Gb.mp4
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec                  receiver
-----------------------------------------------------------

< Reverse >

iperf3 -s 
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 192.168.2.241, port 45870
[  5] local 192.168.2.90 port 5201 connected to 192.168.2.241 port 45886
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   114 MBytes   953 Mbits/sec  120    158 KBytes       
[  5]   1.00-2.00   sec   112 MBytes   935 Mbits/sec  143    141 KBytes       
[  5]   2.00-3.00   sec   110 MBytes   923 Mbits/sec  131    195 KBytes       
[  5]   3.00-4.00   sec   112 MBytes   939 Mbits/sec  142    167 KBytes       
[  5]   4.00-5.00   sec   112 MBytes   942 Mbits/sec  136    133 KBytes       
[  5]   5.00-6.00   sec   111 MBytes   929 Mbits/sec  119    175 KBytes       
[  5]   6.00-7.00   sec   111 MBytes   932 Mbits/sec  126    115 KBytes       
[  5]   7.00-8.00   sec   112 MBytes   943 Mbits/sec  150    113 KBytes       
[  5]   8.00-9.00   sec   105 MBytes   884 Mbits/sec   28    110 KBytes       
[  5]   9.00-10.00  sec   112 MBytes   938 Mbits/sec  140    160 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.08 GBytes   932 Mbits/sec  1235            sender


eth1/lan

iperf3 -s -F VidTest-1.4Gb.mp4 
-----------------------------------------------------------
{openwrt device is 192.168.1.1}
{Laptop attached to openwrt is 192.168.1.134}

Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 192.168.1.1, port 53876
[  5] local 192.168.1.134 port 5201 connected to 192.168.1.1 port 53890
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  31.9 MBytes   267 Mbits/sec                  
[  5]   1.00-2.00   sec  32.5 MBytes   273 Mbits/sec                  
[  5]   2.00-3.00   sec  33.6 MBytes   282 Mbits/sec                  
[  5]   3.00-4.00   sec  29.2 MBytes   245 Mbits/sec                  
[  5]   4.00-5.00   sec  33.8 MBytes   283 Mbits/sec                  
[  5]   5.00-6.00   sec  32.6 MBytes   274 Mbits/sec                  
[  5]   6.00-7.00   sec  34.1 MBytes   286 Mbits/sec                  
[  5]   7.00-8.00   sec  35.0 MBytes   294 Mbits/sec                  
[  5]   8.00-9.00   sec  33.6 MBytes   282 Mbits/sec                  
[  5]   9.00-10.00  sec  32.8 MBytes   275 Mbits/sec                  
[  5]  10.00-10.00  sec   128 KBytes   872 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
        Sent  329 MByte /  329 MByte (100%) of VidTest-1.4Gb.mp4
[  5]   0.00-10.00  sec   329 MBytes   276 Mbits/sec                  receiver
-----------------------------------------------------------

< reverse >

iperf3 -c 192.168.1.1
Connecting to host 192.168.1.1, port 5201
[  5] local 192.168.1.134 port 60508 connected to 192.168.1.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   113 MBytes   948 Mbits/sec    0    393 KBytes       
[  5]   1.00-2.00   sec   111 MBytes   931 Mbits/sec    0    411 KBytes       
[  5]   2.00-3.00   sec   112 MBytes   935 Mbits/sec    0    433 KBytes       
[  5]   3.00-4.00   sec   111 MBytes   933 Mbits/sec    0    433 KBytes       
[  5]   4.00-5.00   sec   111 MBytes   934 Mbits/sec    0    433 KBytes       
[  5]   5.00-6.00   sec   111 MBytes   932 Mbits/sec    0    433 KBytes       
[  5]   6.00-7.00   sec   111 MBytes   930 Mbits/sec    0    433 KBytes       
[  5]   7.00-8.00   sec   111 MBytes   934 Mbits/sec    0    433 KBytes       
[  5]   8.00-9.00   sec   111 MBytes   932 Mbits/sec    0    433 KBytes       
[  5]   9.00-10.00  sec   113 MBytes   944 Mbits/sec    0    573 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   936 Mbits/sec    0            sender
[  5]   0.00-10.00  sec  1.09 GBytes   933 Mbits/sec                  receiver



Throughput (wan (eth0) -> lan (eth1) -> laptop)

Desktop <------> Laptop via Openwrt
192.168.2.90     192.168.1.134

iperf3 -c 192.168.2.90
Connecting to host 192.168.2.90, port 5201
[  5] local 192.168.1.134 port 54694 connected to 192.168.2.90 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   106 MBytes   889 Mbits/sec    0    461 KBytes       
[  5]   1.00-2.00   sec   111 MBytes   933 Mbits/sec    0    461 KBytes       
[  5]   2.00-3.00   sec   111 MBytes   933 Mbits/sec    0    461 KBytes       
[  5]   3.00-4.00   sec   111 MBytes   934 Mbits/sec    0    461 KBytes       
[  5]   4.00-5.00   sec   111 MBytes   932 Mbits/sec    0    461 KBytes       
[  5]   5.00-6.00   sec   111 MBytes   933 Mbits/sec    0    461 KBytes       
[  5]   6.00-7.00   sec   111 MBytes   931 Mbits/sec    0    503 KBytes       
[  5]   7.00-8.00   sec   112 MBytes   938 Mbits/sec    0    503 KBytes       
[  5]   8.00-9.00   sec   111 MBytes   931 Mbits/sec    0    503 KBytes       
[  5]   9.00-10.00  sec   111 MBytes   933 Mbits/sec    0    503 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.08 GBytes   929 Mbits/sec    0            sender
[  5]   0.00-10.00  sec  1.08 GBytes   927 Mbits/sec                  receive





< Reverse >

iperf3 -c 192.168.2.90
Connecting to host 192.168.2.90, port 5201
[  5] local 192.168.1.134 port 54694 connected to 192.168.2.90 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   106 MBytes   889 Mbits/sec    0    461 KBytes       
[  5]   1.00-2.00   sec   111 MBytes   933 Mbits/sec    0    461 KBytes       
[  5]   2.00-3.00   sec   111 MBytes   933 Mbits/sec    0    461 KBytes       
[  5]   3.00-4.00   sec   111 MBytes   934 Mbits/sec    0    461 KBytes       
[  5]   4.00-5.00   sec   111 MBytes   932 Mbits/sec    0    461 KBytes       
[  5]   5.00-6.00   sec   111 MBytes   933 Mbits/sec    0    461 KBytes       
[  5]   6.00-7.00   sec   111 MBytes   931 Mbits/sec    0    503 KBytes       
[  5]   7.00-8.00   sec   112 MBytes   938 Mbits/sec    0    503 KBytes       
[  5]   8.00-9.00   sec   111 MBytes   931 Mbits/sec    0    503 KBytes       
[  5]   9.00-10.00  sec   111 MBytes   933 Mbits/sec    0    503 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.08 GBytes   929 Mbits/sec    0            sender
[  5]   0.00-10.00  sec  1.08 GBytes   927 Mbits/sec                  receive


---------


Results with (gmac0 & gmac1) phy-mode = "rgmii", tx_rx_delay unspecified
(kernel on boot sets tx_delay = 0x30 and rx_delay = 0x10 itself, both gmacs)


eth0/wan
iperf3 -s -F VidTest-1.4Gb.mp4

{openwrt device is 192.168.2.241}
{desktop on openwrt WAN is 192.168.2.90}

iperf3 -s -F VidTest-1.4Gb.mp4 
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 192.168.2.241, port 35070
[  5] local 192.168.2.90 port 5201 connected to 192.168.2.241 port 35084
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   112 MBytes   936 Mbits/sec                  
[  5]   1.00-2.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   2.00-3.00   sec   112 MBytes   938 Mbits/sec                  
[  5]   3.00-4.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   4.00-5.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   5.00-6.00   sec   112 MBytes   940 Mbits/sec                  
[  5]   6.00-7.00   sec   112 MBytes   938 Mbits/sec                  
[  5]   7.00-8.00   sec   112 MBytes   940 Mbits/sec                  
[  5]   8.00-9.00   sec   112 MBytes   939 Mbits/sec                  
[  5]   9.00-10.00  sec   112 MBytes   939 Mbits/sec                  
[  5]  10.00-10.00  sec   384 KBytes   869 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
        Sent 1.09 GByte / 1.09 GByte (100%) of VidTest-1.4Gb.mp4
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec                  receiver
-----------------------------------------------------------


<reverse>
Accepted connection from 192.168.2.241, port 51650
[  5] local 192.168.2.90 port 5201 connected to 192.168.2.241 port 51660
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   114 MBytes   953 Mbits/sec  168    209 KBytes       
[  5]   1.00-2.00   sec   112 MBytes   938 Mbits/sec  224    148 KBytes       
[  5]   2.00-3.00   sec   112 MBytes   940 Mbits/sec  196    158 KBytes       
[  5]   3.00-4.00   sec   112 MBytes   943 Mbits/sec  196    180 KBytes       
[  5]   4.00-5.00   sec   112 MBytes   937 Mbits/sec  196    187 KBytes       
[  5]   5.00-6.00   sec   112 MBytes   940 Mbits/sec  196    195 KBytes       
[  5]   6.00-7.00   sec   112 MBytes   937 Mbits/sec  196    204 KBytes       
[  5]   7.00-8.00   sec   112 MBytes   940 Mbits/sec  224    136 KBytes       
[  5]   8.00-9.00   sec   112 MBytes   940 Mbits/sec  196    158 KBytes       
[  5]   9.00-10.00  sec   110 MBytes   922 Mbits/sec  196    188 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec  1988            sender
        Sent 1.09 GByte / 1.09 GByte (100%) of VidTest-1.4Gb.mp4
-----------------------------------------------------------



eth1/lan

{192.168.1.1 is Openwrt device}
{192.168.1.134 is laptop directly attached to Openwrt}


iperf3 -s -F VidTest-1.4Gb.mp4 
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 192.168.1.1, port 40866
[  5] local 192.168.1.134 port 5201 connected to 192.168.1.1 port 40868
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  67.4 MBytes   565 Mbits/sec                  
[  5]   1.00-2.00   sec  69.4 MBytes   582 Mbits/sec                  
[  5]   2.00-3.00   sec  65.9 MBytes   553 Mbits/sec                  
[  5]   3.00-4.00   sec  66.5 MBytes   558 Mbits/sec                  
[  5]   4.00-5.00   sec  70.2 MBytes   589 Mbits/sec                  
[  5]   5.00-6.00   sec  52.5 MBytes   440 Mbits/sec                  
[  5]   6.00-7.00   sec  67.2 MBytes   564 Mbits/sec                  
[  5]   7.00-8.00   sec  70.2 MBytes   589 Mbits/sec                  
[  5]   8.00-9.00   sec  57.9 MBytes   486 Mbits/sec                  
[  5]   9.00-10.00  sec  66.9 MBytes   561 Mbits/sec                  
[  5]  10.00-10.00  sec   128 KBytes   909 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
        Sent  654 MByte /  654 MByte (100%) of VidTest-1.4Gb.mp4
[  5]   0.00-10.00  sec   654 MBytes   549 Mbits/sec                  receiver




< reverse >

iperf3 -c 192.168.1.134 --reverse
Connecting to host 192.168.1.134, port 5201
Reverse mode, remote host 192.168.1.134 is sending
[  5] local 192.168.1.1 port 58380 connected to 192.168.1.134 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   104 MBytes   870 Mbits/sec                  
[  5]   1.00-2.00   sec  98.5 MBytes   826 Mbits/sec                  
[  5]   2.00-3.00   sec  89.9 MBytes   754 Mbits/sec                  
[  5]   3.00-4.00   sec  87.4 MBytes   733 Mbits/sec                  
[  5]   4.00-5.00   sec  97.0 MBytes   814 Mbits/sec                  
[  5]   5.00-6.00   sec  95.5 MBytes   801 Mbits/sec                  
[  5]   6.00-7.00   sec  82.1 MBytes   689 Mbits/sec                  
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec                  
[  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec                  
[  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   654 MBytes   549 Mbits/sec  235            sender
[  5]   0.00-10.00  sec   654 MBytes   549 Mbits/sec                  receiver





Throughput (wan (eth0) -> lan (eth1) -> laptop)

Desktop <------> Laptop via Openwrt
192.168.2.90     192.168.1.134

iperf3 -c 192.168.2.90
Connecting to host 192.168.2.90, port 5201
[  5] local 192.168.1.134 port 44380 connected to 192.168.2.90 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  91.8 MBytes   769 Mbits/sec   15   76.4 KBytes       
[  5]   1.00-2.00   sec  99.5 MBytes   835 Mbits/sec   11    102 KBytes       
[  5]   2.00-3.00   sec  98.8 MBytes   828 Mbits/sec   12    167 KBytes       
[  5]   3.00-4.00   sec  95.4 MBytes   800 Mbits/sec   17    126 KBytes       
[  5]   4.00-5.00   sec   106 MBytes   890 Mbits/sec    9    117 KBytes       
[  5]   5.00-6.00   sec  96.5 MBytes   810 Mbits/sec   15    123 KBytes       
[  5]   6.00-7.00   sec  99.6 MBytes   835 Mbits/sec   13    144 KBytes       
[  5]   7.00-8.00   sec   100 MBytes   842 Mbits/sec   15   58.0 KBytes       
[  5]   8.00-9.00   sec  96.1 MBytes   806 Mbits/sec   15    115 KBytes       
[  5]   9.00-10.00  sec  95.4 MBytes   800 Mbits/sec   14    126 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   980 MBytes   822 Mbits/sec  136            sender
[  5]   0.00-10.00  sec   979 MBytes   821 Mbits/sec                  receiver


< reverse >

perf3 -c 192.168.2.90 --reverse
Connecting to host 192.168.2.90, port 5201
Reverse mode, remote host 192.168.2.90 is sending
[  5] local 192.168.1.134 port 51148 connected to 192.168.2.90 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  40.6 MBytes   340 Mbits/sec                  
[  5]   1.00-2.00   sec  54.9 MBytes   460 Mbits/sec                  
[  5]   2.00-3.00   sec  49.6 MBytes   416 Mbits/sec                  
[  5]   3.00-4.00   sec  47.4 MBytes   397 Mbits/sec                  
[  5]   4.00-5.00   sec  45.9 MBytes   385 Mbits/sec                  
[  5]   5.00-6.00   sec  52.8 MBytes   443 Mbits/sec                  
[  5]   6.00-7.00   sec  45.1 MBytes   379 Mbits/sec                  
[  5]   7.00-8.00   sec  46.1 MBytes   387 Mbits/sec                  
[  5]   8.00-9.00   sec  42.8 MBytes   359 Mbits/sec                  
[  5]   9.00-10.00  sec  40.6 MBytes   341 Mbits/sec                  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec   467 MBytes   392 Mbits/sec  403            sender
[  5]   0.00-10.00  sec   466 MBytes   391 Mbits/sec                  receiver

____________________________________


> 
> > I can't reproduce your problem in my test.
> > 
> > eth0/gmac1 (as lan):
> > root@OpenWrt:~# iperf3 -c 192.168.1.100
> > Connecting to host 192.168.1.100, port 5201
> > [ ID] Interval           Transfer     Bitrate         Retr
> > [  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec   29
> > sender [  5]   0.00-10.04  sec  1.10 GBytes   936 Mbits/sec
> > receiver
> > 
> > root@OpenWrt:~# iperf3 -c 192.168.1.100 -R
> > Connecting to host 192.168.1.100, port 5201
> > Reverse mode, remote host 192.168.1.100 is sending
> > [ ID] Interval           Transfer     Bitrate         Retr
> > [  5]   0.00-10.04  sec  1.10 GBytes   939 Mbits/sec    1
> > sender [  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec
> > receiver
> > 
> > eth1/gmac0 (as wan):
> > root@OpenWrt:~# iperf3 -c 192.168.0.2 -P 4
> > Connecting to host 192.168.0.2, port 5201
> > [ ID] Interval           Transfer     Bitrate         Retr
> > [SUM]   0.00-10.00  sec  1.10 GBytes   945 Mbits/sec  1191
> > sender [SUM]   0.00-10.05  sec  1.09 GBytes   935 Mbits/sec
> >  receiver
> > 
> > root@OpenWrt:~# iperf3 -c 192.168.0.2 -R
> > Connecting to host 192.168.0.2, port 5201
> > Reverse mode, remote host 192.168.0.2 is sending
> > [ ID] Interval           Transfer     Bitrate         Retr
> > [  5]   0.00-10.06  sec  1.10 GBytes   939 Mbits/sec    6
> > sender [  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec
> > receiver
> > 
> > --
> > 2.25.1
> > 
> > 
> > 
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


